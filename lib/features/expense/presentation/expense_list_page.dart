import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/dialog_helpers.dart';
import 'package:teatally/features/expense/application/cubit/expense_cubit.dart';
import 'package:intl/intl.dart';
import 'package:teatally/features/expense/domain/expense_form_model.dart';
import 'package:teatally/features/home/presentation/components/groups_listing.dart';

@RoutePage()
class ExpenseListPage extends StatefulWidget {
  const ExpenseListPage({super.key, this.groupId, this.groupName});
  final String? groupId;
  final String? groupName;
  @override
  State<ExpenseListPage> createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends State<ExpenseListPage> {
  @override
  void didChangeDependencies() {
    context.read<ExpenseCubit>().getAllExpense(widget.groupId);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: CommonWidgets.backButton(context),
            title: Txt(
              '${widget.groupName ?? ''} Expenses',
              style: TxtStyle.headerSSemiBold,
            ),
          ),
          body: SafeArea(
              child: RefreshIndicator(
            onRefresh: () =>
                context.read<ExpenseCubit>().getAllExpense(widget.groupId),
            child: state.expenseListStatus.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (data) {
                if (data.isEmpty) {
                  return const Center(
                      child: NoItemPlaceHolder(
                          image: 'assets/bevimages/saving.png',
                          color: AppColors.lightGreen,
                          label:
                              'Looks like the group’s expense list is empty'));
                }
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      PendingAmountStatus(expenses: data),
                      const VerticalSpacing(10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final expense = data[index];
                            return InkWell(
                              onTap: () => AutoRouter.of(context).push(
                                  ExpenseDetailRoute(docID: expense.docId)),
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    color: context
                                        .theme.appColors.backgroundSecondary,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: AppColors.grey)),
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    DateDisplayBox(
                                      date: expense.date,
                                      borderColor: Colors.transparent,
                                      backgroundColor: AppColors.grey,
                                    ),
                                    const HorizontalSpacing(15),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Txt(
                                            "₹ ${expense.total.toStringAsFixed(2)}",
                                            style: TxtStyle.bodyLSemiBold,
                                          ),
                                          const VerticalSpacing(5),
                                          Txt(
                                            expense.isPaid ?? false
                                                ? 'Paid By ${expense.paidByUserName}'
                                                : 'Pending',
                                            color: expense.isPaid ?? false
                                                ? context.theme.appColors
                                                    .fontSecondary
                                                : context
                                                    .theme.appColors.danger,
                                            style: TxtStyle.bodyMRegular,
                                          )
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: context
                                              .theme.appColors.fontSecondary,
                                        ))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (failure) => Center(child: Txt(failure.toString())),
            ),
          )),
        );
      },
    );
  }
}

class DateDisplayBox extends StatelessWidget {
  final DateTime? date;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? dayStyle;
  final TextStyle? monthStyle;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const DateDisplayBox({
    super.key,
    required this.date,
    this.backgroundColor,
    this.borderColor,
    this.dayStyle,
    this.monthStyle,
    this.padding,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor ?? Colors.grey.shade300),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Txt(date != null ? DateFormat('dd').format(date!) : '00', // e.g. "10"
              style: TxtStyle.headerXSSemiBold),
          Txt(
            date != null
                ? DateFormat('MMM').format(date!).toUpperCase()
                : 'NIL', // e.g. "OCT"
            style: TxtStyle.bodySRegular,
          ),
        ],
      ),
    );
  }
}

class PendingAmountStatus extends StatelessWidget {
  final List<ExpenseFormModel> expenses;

  const PendingAmountStatus({
    super.key,
    required this.expenses,
  });

  double get _pendingTotal {
    return expenses
        .where((e) => (!(e.isPaid ?? false)))
        .fold<double>(0.0, (sum, e) => sum + (e.total));
  }

  @override
  Widget build(BuildContext context) {
    final pending = _pendingTotal;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: pending > 0
            ? context.theme.appColors.danger.withValues(alpha: 0.1)
            : context.theme.appColors.success.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: pending > 0
              ? context.theme.appColors.danger.withValues(alpha: 0.5)
              : context.theme.appColors.success.withValues(alpha: 0.5),
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            pending > 0 ? Icons.warning_amber_rounded : Icons.check_circle,
            color: pending > 0
                ? context.theme.appColors.danger
                : context.theme.appColors.success,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              pending > 0
                  ? "Pending Amount: ₹${pending.toStringAsFixed(2)}"
                  : "All expenses are settled 🎉",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: pending > 0
                    ? context.theme.appColors.danger
                    : context.theme.appColors.success,
              ),
            ),
          ),
          if (pending > 0)
            CommonWidgets.coloredTextButton(context,
                backgroundColor: context.theme.appColors.danger,
                buttonPadding: 8,
                text: 'Settle', onPressed: () {
              DialogHelpers.confirmDeleteDialog(
                  title: 'Settle Pending Amount?',
                  message:
                      'Do you want to mark all pending expenses totaling ₹$pending as paid?',
                  context: context,
                  onConfirmed: () {
                    final pendingIDs = expenses
                        .where((e) => !(e.isPaid ?? false))
                        .map((e) => e.docId ?? '')
                        .where((id) => id.isNotEmpty)
                        .toList();
                    context.read<ExpenseCubit>().settleAllPendingExpense(
                        expenses.first.groupId, pendingIDs);
                  },
                  confirmButtonText: 'Settle',
                  onCanceled: () {});
            })
        ],
      ),
    );
  }
}
