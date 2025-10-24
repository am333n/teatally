import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/core/app_animations.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/injection/injection.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/form_components.dart';
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart';
import 'package:teatally/features/expense/application/cubit/expense_cubit.dart';
import 'package:teatally/features/expense/domain/expense_form_model.dart';
import 'package:teatally/features/expense/presentation/custom_date_picker.dart';
import 'package:teatally/features/group/application/cubit/group_detail_cubit.dart';

@RoutePage()
class ExpenseFormPage extends StatefulWidget {
  const ExpenseFormPage(
      {super.key, required this.sessionDocId, this.expenseDocID});
  final String? sessionDocId;
  final String? expenseDocID;
  @override
  State<ExpenseFormPage> createState() => _ExpenseFormPageState();
}

class _ExpenseFormPageState extends State<ExpenseFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isEdit = false;
  double totalAmount = 0;
  double remainingAmount = 0;
  @override
  void didChangeDependencies() {
    isEdit = widget.expenseDocID != null;
    if (isEdit) {
      context.read<ExpenseCubit>().getEditData(widget.expenseDocID);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      onChanged: () => _recalculateRemaining(),
      child: Scaffold(
        appBar: AppBar(
          leading: CommonWidgets.backButton(context),
          title: Txt(
            '${isEdit ? 'Edit' : 'Save'} Expense',
            style: TxtStyle.headerSSemiBold,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            CompactDatePicker(
              name: 'date',
              initialValue: DateTime.now(),
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<ExpenseCubit, ExpenseState>(
            builder: (context, state) {
              return state.formData.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (data) {
                  totalAmount = data.total;
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            _totalAmountBox(
                              amount: totalAmount,
                              color: AppColors.lightYellow,
                              title: 'Total',
                            ),
                            const HorizontalSpacing(10),
                            _totalAmountBox(
                              amount: remainingAmount,
                              color: remainingAmount != 0
                                  ? context.theme.appColors.danger
                                      .withValues(alpha: 0.5)
                                  : AppColors.lightGreen,
                              title: 'Remaining',
                            ),
                          ],
                        ),
                        const VerticalSpacing(15),
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.userExpense.length,
                            itemBuilder: (context, index) {
                              final item = data.userExpense[index];
                              return _userExpenseItem(item);
                            },
                          ),
                        ),
                        const VerticalSpacing(10),
                        FormComponents.statusToggleSwitch(
                          context,
                          initialValue: data.isPaid ?? false,
                          name: 'status',
                          label: '',
                          onChanged: (val) {
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 10),
                        AnimatedSize(
                          duration: AppAnimations.transitionDuration,
                          child:
                              (_formKey.currentState?.getRawValue('status') ??
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
                        AnimatedSwitcher(
                          duration: AppAnimations.transitionDuration,
                          child: remainingAmount == 0
                              ? CommonWidgets.coloredTextButton(
                                  context,
                                  isLoading: data.isLoading,
                                  text: isEdit ? 'Update' : 'Save',
                                  onPressed: remainingAmount == 0
                                      ? () async {
                                          if (_formKey.currentState
                                                  ?.saveAndValidate() ??
                                              false) {
                                            final values =
                                                _formKey.currentState!.value;
                                            final isPaid =
                                                values['status'] ?? false;
                                            final paidByUserId = isPaid
                                                ? values['paidByUserId']
                                                    as String?
                                                : null;
                                            final paidByUserName = (isPaid &&
                                                    paidByUserId != null)
                                                ? data.members
                                                    .firstWhere((m) =>
                                                        m.uid == paidByUserId)
                                                    .displayName
                                                : null;

                                            final updatedModel = data
                                                .fromForm(values)
                                                .copyWith(
                                                  paidByUserId: paidByUserId,
                                                  paidByUserName:
                                                      paidByUserName,
                                                );
                                            final expenseCubit =
                                                context.read<ExpenseCubit>();
                                            final groupCubit = context
                                                .read<GroupDetailCubit>();
                                            if (isEdit) {
                                              expenseCubit.updateExpenseDetails(
                                                  widget.expenseDocID,
                                                  updatedModel);
                                            } else {
                                              final response =
                                                  await expenseCubit
                                                      .createExpense(
                                                          updatedModel);

                                              if (response) {
                                                await groupCubit.deleteSession(
                                                    widget.sessionDocId);
                                              }
                                            }
                                          }
                                        }
                                      : () {},
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  );
                },
                error: (failure) => Center(child: Txt(failure.toString())),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _userExpenseItem(ExpenseUserData item) {
    return UserEspenseListing(
      item: item,
      showSubItems: () {
        final formValue = _formKey.currentState?.getRawValue(item.uid);
        if (formValue == null) return true;

        final num1 = num.tryParse(formValue.toString());
        final num2 = item.amount is num
            ? item.amount
            : num.tryParse(item.amount.toString());
        return num1 != null && num2 != null && num1 == num2;
      },
      onChanged: (val) => _recalculateRemaining(),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 6),
    //   child: Row(
    //     children: [
    //       Expanded(
    //           flex: 3,
    //           child: Row(
    //             children: [
    //               Txt(item.userName),
    //               IconButton(
    //                   onPressed: () {},
    //                   icon: Icon(Icons.add_circle_outline_rounded)),
    //             ],
    //           )),
    //       Expanded(
    //         child: FormBuilderTextField(
    //           name: item.uid,
    //           initialValue: item.amount.toString(),
    //           decoration: FormComponents.formFieldDecoration(context, '')
    //               .copyWith(
    //                   contentPadding:
    //                       const EdgeInsets.symmetric(horizontal: 15),
    //                   prefix: const Txt(
    //                     '₹ ',
    //                     color: Colors.black26,
    //                   )),
    //           keyboardType: TextInputType.number,
    //           onChanged: (val) => _recalculateRemaining(),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  void _recalculateRemaining() {
    if (_formKey.currentState == null) return;

    final fields = _formKey.currentState!.fields;
    double totalEntered = 0;

    for (final field in fields.values) {
      final value = double.tryParse(field.value?.toString() ?? '') ?? 0;
      totalEntered += value;
    }

    setState(() {
      remainingAmount = totalAmount - totalEntered;
    });
  }

  Expanded _totalAmountBox(
      {required double amount, required Color color, required title}) {
    return Expanded(
      child: AnimatedContainer(
        duration: AppAnimations.transitionDuration,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Txt(
              title,
              style: TxtStyle.bodyLSemiBold,
            ),
            const VerticalSpacing(8),
            Txt(
              "₹${amount.toString()}",
              style: TxtStyle.headerMBold,
            ),
          ],
        ),
      ),
    );
  }
}

class UserEspenseListing extends StatefulWidget {
  const UserEspenseListing(
      {super.key,
      required this.item,
      this.onChanged,
      required this.showSubItems});
  final ExpenseUserData item;
  final void Function(String?)? onChanged;
  final bool Function()? showSubItems;
  @override
  State<UserEspenseListing> createState() => _UserEspenseListingState();
}

class _UserEspenseListingState extends State<UserEspenseListing> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: AnimatedSize(
        duration: AppAnimations.transitionDuration,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Txt(
                          widget.item.userName,
                          // style: TxtStyle.bodyLSemiBold,
                        ),
                        if (widget.item.items.isNotEmpty &&
                            (widget.showSubItems?.call() ?? false))
                          AnimatedSwitcher(
                            duration: AppAnimations.transitionDuration,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                icon: Icon(
                                  key: ValueKey(isExpanded),
                                  isExpanded
                                      ? Icons.arrow_circle_up
                                      : Icons.add_circle_outline_rounded,
                                  color: Colors.black26,
                                )),
                          ),
                      ],
                    )),
                Expanded(
                  child: FormBuilderTextField(
                    name: widget.item.uid,
                    initialValue: widget.item.amount.toString(),
                    decoration: FormComponents.formFieldDecoration(context, '')
                        .copyWith(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            prefix: const Txt(
                              '₹ ',
                              color: Colors.black26,
                            )),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => widget.onChanged?.call(value),
                  ),
                ),
              ],
            ),
            if (isExpanded && (widget.showSubItems?.call() ?? false))
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.item.items.length,
                itemBuilder: (context, index) {
                  final items = widget.item.items[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, top: 8),
                    child: Row(
                      children: [
                        Txt(
                          "- ${items.name}",
                          style: TxtStyle.bodyMRegular,
                        ),
                        const HorizontalSpacing(5),
                        Txt(
                          "x${items.count}",
                          style: TxtStyle.bodyMSemiBold,
                        )
                      ],
                    ),
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}

enum ExpenseStatus {
  paid('Paid'),
  pending('Pending');

  const ExpenseStatus(this.label);
  final String label;
}
