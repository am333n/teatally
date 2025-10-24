import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:teatally/core/app_animations.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/common/api_state.dart';
import 'package:teatally/core/injection/injection.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/dialog_helpers.dart';
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart';
import 'package:teatally/features/expense/application/cubit/expense_cubit.dart';
import 'package:teatally/features/expense/presentation/payment_status_form.dart';

@RoutePage()
class ExpenseDetailPage extends StatefulWidget {
  const ExpenseDetailPage({super.key, this.docID});
  final String? docID;
  @override
  State<ExpenseDetailPage> createState() => _ExpenseDetailPageState();
}

class _ExpenseDetailPageState extends State<ExpenseDetailPage> {
  @override
  void didChangeDependencies() {
    context.read<ExpenseCubit>().getExpenseDetails(widget.docID);
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
            title: const Txt(
              'Expenses Details',
              style: TxtStyle.headerSSemiBold,
            ),
            actions: [
              if (state.expenseDetailsStatus.getOrNull()?.updatedByUserName !=
                  null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          'assets/group_icons/person_edit.png',
                          color: context.theme.appColors.fontPrimary,
                        ),
                      ),
                      const HorizontalSpacing(5),
                      Txt(
                        state.expenseDetailsStatus
                                .getOrNull()
                                ?.updatedByUserName ??
                            '-',
                        style: TxtStyle.bodySRegular,
                      )
                    ],
                  ),
                )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    height: kToolbarHeight * 1.5,
                    child: Row(
                      children: [
                        _detailBox(
                            state: state.expenseDetailsStatus,
                            value: (data) =>
                                "₹${data.total.toStringAsFixed(2)}",
                            color: (data) => AppColors.lightYellow,
                            label: (_) => 'Amount'),
                        const HorizontalSpacing(15),
                        _detailBox(
                            state: state.expenseDetailsStatus,
                            label: (data) => DateFormat('h:mm a')
                                .format(data.date ?? DateTime.now()),
                            color: (data) => AppColors.lightGreen,
                            value: (data) => DateFormat('d MMMM')
                                .format(data.date ?? DateTime.now())),
                        const HorizontalSpacing(15),
                        Column(
                          children: [
                            Expanded(
                              child: _iconBox(
                                  onTap: () {
                                    AutoRouter.of(context).push(
                                        ExpenseFormRoute(
                                            sessionDocId: null,
                                            expenseDocID: state
                                                .expenseDetailsStatus
                                                .getOrNull()
                                                ?.docId));
                                  },
                                  icon: const Icon(
                                    Icons.edit_rounded,
                                    size: 20,
                                  )),
                            ),
                            const VerticalSpacing(10),
                            Expanded(
                              child: _iconBox(
                                  onTap: () async {
                                    await DialogHelpers.confirmDeleteDialog(
                                        context: context,
                                        onConfirmed: () {
                                          final data = state
                                              .expenseDetailsStatus
                                              .getOrNull();
                                          context
                                              .read<ExpenseCubit>()
                                              .deleteExpense(
                                                  data?.docId, data?.groupId);
                                        },
                                        onCanceled: () {});
                                  },
                                  icon: Icon(
                                    Icons.delete_outline_rounded,
                                    color: context.theme.appColors.danger,
                                    size: 20,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const VerticalSpacing(15),
                  AppCard(
                      color: AppColors.grey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Txt(
                                  'Payment Status',
                                  style: TxtStyle.headerSSemiBold,
                                ),
                              ),
                              _iconBox(
                                icon: const Icon(Icons.refresh_outlined),
                                onTap: () {
                                  context
                                      .read<ExpenseCubit>()
                                      .getExpenseDetails(widget.docID);
                                },
                              ),
                              const HorizontalSpacing(5),
                              CommonWidgets.coloredTextButton(
                                context,
                                text: 'Change',
                                buttonPadding: 8,
                                backgroundColor:
                                    context.theme.appColors.fontPrimary,
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return PaymentStatusForm(
                                        expenseDocID: state.expenseDetailsStatus
                                            .getOrNull()
                                            ?.docId,
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          const VerticalSpacing(15),
                          Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.white),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: state.expenseDetailsStatus.when(
                                loading: () => Row(
                                  children: [
                                    Icon(
                                      Icons.pending_outlined,
                                      color: context.theme.appColors.success,
                                    ),
                                    const HorizontalSpacing(5),
                                    const Expanded(
                                      child: Txt('Loading...',
                                          style: TxtStyle.bodyLBold),
                                    ),
                                  ],
                                ),
                                loaded: (data) {
                                  return Row(
                                    children: [
                                      Icon(
                                        data.isPaid ?? false
                                            ? Icons.check_circle_outline
                                            : Icons.pending_outlined,
                                        color: data.isPaid ?? false
                                            ? context.theme.appColors.success
                                            : context.theme.appColors.danger,
                                      ),
                                      const HorizontalSpacing(5),
                                      Expanded(
                                        child: RichText(
                                            text: TextSpan(children: [
                                          txtSpan(context,
                                              text: data.isPaid ?? false
                                                  ? 'Paid by '
                                                  : 'Pending ',
                                              style: data.isPaid ?? false
                                                  ? TxtStyle.bodyLRegular
                                                  : TxtStyle.bodyLBold),
                                          if (data.isPaid ?? false)
                                            txtSpan(context,
                                                text:
                                                    '${context.currentUser?.uid == data.paidByUserId ? 'You' : data.paidByUserName}',
                                                style: TxtStyle.bodyLBold)
                                        ])),
                                      ),
                                    ],
                                  );
                                },
                                error: (failure) => Txt(failure.toString(),
                                    style: TxtStyle.bodyLBold),
                              )),
                          const VerticalSpacing(10),
                        ],
                      )),
                  const VerticalSpacing(15),
                  state.expenseDetailsStatus.when(
                      loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                      loaded: (data) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.userExpense.length,
                          itemBuilder: (context, index) {
                            final userItem = data.userExpense[index];
                            return Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: (userItem?.photoURL !=
                                                null &&
                                            (userItem?.photoURL!.isNotEmpty ??
                                                false))
                                        ? NetworkImage(userItem.photoURL!)
                                        : null,
                                    backgroundColor:
                                        Colors.blueAccent.withOpacity(0.2),
                                    child: (userItem?.photoURL == null ||
                                            userItem!.photoURL!.isEmpty)
                                        ? Txt(
                                            userItem?.userName?.isNotEmpty ==
                                                    true
                                                ? userItem!.userName![0]
                                                    .toUpperCase()
                                                : '?',
                                          )
                                        : null,
                                  ),
                                  title: Txt(userItem.userName),
                                  trailing: Txt(
                                    "₹${userItem.amount.toStringAsFixed(2)}",
                                    style: TxtStyle.bodyLBold,
                                  ),
                                ),
                                if (userItem.items != null &&
                                    userItem.items.isNotEmpty)
                                  ListView.builder(
                                    itemCount: userItem.items.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final item = userItem.items[index];

                                      return Row(
                                        children: [
                                          const Expanded(
                                              flex: 1, child: SizedBox()),
                                          Expanded(
                                              flex: 2,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                decoration: BoxDecoration(
                                                    border: const Border(
                                                        left: BorderSide(
                                                            color:
                                                                AppColors.grey),
                                                        bottom: BorderSide(
                                                            color: AppColors
                                                                .grey)),
                                                    // gradient: LinearGradient(
                                                    //     begin: Alignment
                                                    //         .bottomLeft,
                                                    //     end: Alignment.topRight,
                                                    //     stops: [
                                                    //       0.7,
                                                    //       1
                                                    //     ],
                                                    //     colors: [
                                                    //       Colors.white,
                                                    //       context
                                                    //           .theme
                                                    //           .appColors
                                                    //           .backgroundPrimary
                                                    //     ]),
                                                    borderRadius: BorderRadius.only(
                                                        bottomLeft: index ==
                                                                (userItem.items
                                                                        .length -
                                                                    1)
                                                            ? const Radius
                                                                .circular(12)
                                                            : Radius.zero)),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Txt(item.name,
                                                          color: context
                                                              .theme
                                                              .appColors
                                                              .fontSecondary,
                                                          style: TxtStyle
                                                              .bodyMRegular),
                                                    ),
                                                    const HorizontalSpacing(8),
                                                    Txt(
                                                      'x${item.count}',
                                                      color: context
                                                          .theme
                                                          .appColors
                                                          .fontSecondary,
                                                      style: TxtStyle.bodyMBold,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          const Expanded(
                                              flex: 1, child: SizedBox()),
                                        ],
                                      );
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: ListTile(
                                          dense: true,
                                          visualDensity: VisualDensity.compact,
                                          leading: CircleAvatar(
                                            maxRadius: 15,
                                            child: Txt('x${item.count}'),
                                          ),
                                          title: Txt(item.name),
                                        ),
                                      );
                                    },
                                  )
                              ],
                            );
                          },
                        );
                      },
                      error: (failure) => Center(
                            child: Txt(failure.toString()),
                          ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Expanded _detailBox<T>(
      {required ApiState<T> state,
      required String? Function(T data) value,
      required Color Function(T data) color,
      required String? Function(T data) label}) {
    return Expanded(
      child: AppCard(
        color: state.maybeWhen(
          orElse: () => AppColors.lightYellow,
          loaded: (data) => color.call(data),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Txt(
              state.maybeWhen(
                orElse: () => '- -',
                loaded: (data) => label.call(data) ?? '-',
              ),
              style: TxtStyle.bodyLSemiBold,
            ),
            const VerticalSpacing(8),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: state.maybeWhen(
                  loading: () => const SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator()),
                  loaded: (data) => Txt(
                    // "₹${amount.toString()}",
                    value?.call(data) ?? '-',
                    style: TxtStyle.headerMBold,
                  ),
                  orElse: () => const Txt(
                    // "₹${amount.toString()}",
                    '-',
                    style: TxtStyle.headerMBold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _iconBox({
    required Icon icon,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
          duration: AppAnimations.transitionDuration,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: AppColors.grey),
          padding: const EdgeInsets.all(8),
          child: icon),
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.color,
  });
  final Widget child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: AppAnimations.transitionDuration,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
        padding: const EdgeInsets.all(12),
        child: child);
  }
}
