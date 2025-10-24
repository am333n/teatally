import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/core/app_animations.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/form_components.dart';
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart';
import 'package:teatally/features/expense/application/cubit/expense_cubit.dart';
import 'package:teatally/features/expense/presentation/expense_detail_page.dart';

class PaymentStatusForm extends StatefulWidget {
  const PaymentStatusForm({
    super.key,
    this.expenseDocID,
  });
  final String? expenseDocID;
  @override
  State<PaymentStatusForm> createState() => _PaymentStatusFormState();
}

class _PaymentStatusFormState extends State<PaymentStatusForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void didChangeDependencies() {
    context.read<ExpenseCubit>().getEditData(widget.expenseDocID);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseState>(
      builder: (context, state) {
        return FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacing(10),
                Row(
                  children: [
                    const Expanded(
                      child: Txt(
                        'Payment Status',
                        style: TxtStyle.headerSSemiBold,
                      ),
                    ),
                    const CloseButton()
                  ],
                ),
                const VerticalSpacing(25),
                Expanded(
                  child: state.formData.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (data) {
                      return Column(
                        children: [
                          Expanded(
                            child: FormComponents.statusToggleSwitch(
                              context,
                              initialValue: data.isPaid ?? false,
                              name: 'status',
                              label: '',
                              onChanged: (val) {
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: AnimatedSize(
                              duration: AppAnimations.transitionDuration,
                              child: (_formKey.currentState
                                          ?.getRawValue('status') ??
                                      data.isPaid ??
                                      false)
                                  ? FormComponents.formBuilderDropDownWithId<
                                      String>(
                                      context,
                                      fieldName:
                                          'paidByUserId', // important: name used by the form
                                      label: 'Paid By',
                                      isRequired: true,
                                      initialValue: context.currentUser?.uid,
                                      items: data.members
                                          .map((e) => DropdownItem(
                                              e.uid, e.displayName ?? '-'))
                                          .toList(),
                                      hintText: '',
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                          CommonWidgets.coloredTextButton(context, text: "Save",
                              onPressed: () async {
                            if (_formKey.currentState?.saveAndValidate() ??
                                false) {
                              final values = _formKey.currentState!.value;
                              final isPaid = values['status'] ?? false;
                              final paidByUserId = isPaid
                                  ? values['paidByUserId'] as String?
                                  : null;
                              final paidByUserName = (isPaid &&
                                      paidByUserId != null)
                                  ? data.members
                                      .firstWhere((m) => m.uid == paidByUserId)
                                      .displayName
                                  : null;

                              final updatedModel = data.copyWith(
                                paidByUserId: paidByUserId,
                                isPaid: isPaid,
                                paidByUserName: paidByUserName,
                              );
                              await context
                                  .read<ExpenseCubit>()
                                  .updateExpenseDetails(
                                      widget.expenseDocID, updatedModel);
                            }
                          })
                        ],
                      );
                    },
                    error: (failure) => Center(child: Txt(failure.toString())),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
