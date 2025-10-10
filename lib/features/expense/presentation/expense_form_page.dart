import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/form_components.dart';
import 'package:teatally/features/expense/application/cubit/expense_cubit.dart';
import 'package:teatally/features/expense/domain/expense_form_model.dart';

@RoutePage()
class ExpenseFormPage extends StatefulWidget {
  const ExpenseFormPage({super.key});

  @override
  State<ExpenseFormPage> createState() => _ExpenseFormPageState();
}

class _ExpenseFormPageState extends State<ExpenseFormPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseState>(
      builder: (context, state) {
        return state.formData.when(
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (data) {
            return Scaffold(
                body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FormBuilder(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        _totalAmountBox(
                            amount: data.total,
                            color: AppColors.lightYellow,
                            title: 'Total'),
                        HorizontalSpacing(10),
                        _totalAmountBox(
                            amount: data.remainingAmount,
                            color: AppColors.lightGreen,
                            title: 'Remaining'),
                      ],
                    ),
                    VerticalSpacing(15),
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.userExpense.length,
                        itemBuilder: (context, index) {
                          final item = data.userExpense[index];
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(flex: 3, child: Txt(item.userName)),
                                  Expanded(
                                    child: FormComponents.formBuilderTextField(
                                        context,
                                        initialValue: item.amount.toString(),
                                        fieldName: item.uid,
                                        label: '',
                                        hintText: ''),
                                  )
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )),
              ),
            ));
          },
          error: (failure) => Center(
            child: Txt(failure.toString()),
          ),
        );
      },
    );
  }

  Expanded _totalAmountBox(
      {required double amount, required Color color, required title}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Txt(
              title,
              style: TxtStyle.bodyLSemiBold,
            ),
            VerticalSpacing(8),
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
