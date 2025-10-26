import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/app_animations.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/common/extensions.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/style_constants.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/dialog_helpers.dart';
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart';
import 'package:teatally/features/expense/application/cubit/expense_cubit.dart';
import 'package:teatally/features/group/application/cubit/group_detail_cubit.dart';
import 'package:teatally/features/group/application/cubit/group_detail_state.dart';
import 'package:teatally/features/home/domain/group_model.dart';

class SessionControls extends StatelessWidget {
  const SessionControls({
    super.key,
    required this.groupdetails,
  });
  final GroupModel? groupdetails;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailCubit, GroupDetailState>(
      builder: (context, state) {
        return AnimatedSize(
          alignment: Alignment.centerRight,
          duration: AppAnimations.transitionDuration,
          child: AnimatedSwitcher(
            duration: AppAnimations.transitionDuration,
            child: state.sessionState.when(
              loading: () => SizedBox.shrink(
                key: ValueKey(state.sessionState),
              ),
              loaded: (data) {
                if (data == null) {
                  return const SizedBox.shrink();
                }
                if (data?.isCreatedByCurrentUser ?? false) {
                  return Row(
                    key: ValueKey(state.sessionState.getOrNull()?.docId),
                    children: [
                      CommonWidgets.borderIconButton(
                        context,
                        color: context.theme.appColors.danger,
                        icon: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.stop,
                            color: context.theme.appColors.danger,
                          ),
                        ),
                        onPressed: () {
                          DialogHelpers.confirmDeleteDialog(
                              context: context,
                              title: 'Stop Session?',
                              message:
                                  'Are sure you want to stop current session without saving?',
                              confirmButtonText: 'Confirm',
                              onConfirmed: () {
                                context
                                    .read<GroupDetailCubit>()
                                    .deleteSession(data?.docId);
                              },
                              onCanceled: () {});
                        },
                      ),
                      const HorizontalSpacing(15),
                      Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CommonWidgets.coloredTextButton(context,
                              height: 40,
                              buttonPadding: 10,
                              text: ' Save  ', onPressed: () {
                            context
                                .read<ExpenseCubit>()
                                .setUpExpenseDataFromSession(
                                    data, state.membersState.getOrNull() ?? []);
                            AutoRouter.of(context).push(
                                ExpenseFormRoute(sessionDocId: data?.docId));
                          })
                          // : Txt(
                          //     'SessionBy: ${loadedStateData.members?.firstWhere((e) => e.uid == loadedStateData.session?.startedBy).displayName}'),

                          ),
                    ],
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        builder: (context) {
                          return ListView(
                            shrinkWrap: true,
                            padding: Spacing.all,
                            children: [
                              Container(
                                padding: Spacing.all,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Txt(
                                            'This session is started by:',
                                            color: context
                                                .theme.appColors.fontSecondary,
                                          ),
                                          Gap.verticalSmall,
                                          Txt(
                                            data.startedByName ?? 'Unknown',
                                            style: TxtStyle.headerXSBold,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: Spacing.all,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Txt(
                                            "${data.createdAt.toDayMonthString()}",
                                            color: Colors.white,
                                          ),
                                          Txt(
                                            "${data.createdAt.toTimeString()}",
                                            color: Colors.white,
                                            style: TxtStyle.bodyLSemiBold,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gap.verticalMedium,
                              Txt(
                                'You can:',
                                style: TxtStyle.headerXSSemiBold,
                                color: context.theme.appColors.primary,
                              ),
                              Gap.verticalSmall,
                              CommonWidgets.borderColoredTextButton(
                                context,
                                text: 'Ping to stop',
                                onPressed: () {
                                  context
                                      .read<GroupDetailCubit>()
                                      .pingSessionOwner(groupdetails,
                                          'is asking you to stop session');
                                  Navigator.of(context).pop();
                                },
                              ),
                              Gap.verticalMedium,
                              (data.transferRequest?.accepted == false &&
                                      data.transferRequest?.requesterUid ==
                                          context.currentUser?.uid)
                                  ? Container(
                                      padding: Spacing.all,
                                      decoration: BoxDecoration(
                                          color: context
                                              .theme.appColors.fontSecondary
                                              .withValues(alpha: 0.2),
                                          border: Border.all(
                                            color: context
                                                .theme.appColors.fontSecondary,
                                          ),
                                          borderRadius: RoundedCorner.large),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons
                                              .sentiment_dissatisfied_rounded),
                                          Gap.horizontalMedium,
                                          const Txt(
                                            'Your Request Rejected',
                                            style: TxtStyle.bodyMRegular,
                                          ),
                                        ],
                                      ))
                                  : CommonWidgets.coloredTextButton(
                                      context,
                                      text: 'Request Ownership',
                                      onPressed: () {
                                        context
                                            .read<GroupDetailCubit>()
                                            .requestOwnershipTransfer(
                                                groupdetails);
                                        Navigator.of(context).pop();
                                      },
                                    )
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      height: 40,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('assets/group_icons/break.gif'),
                          ),
                          const HorizontalSpacing(5),
                          Expanded(
                            child: Txt(
                              data.startedByName ?? 'Unknown',
                              overflow: TextOverflow.ellipsis,
                              style: TxtStyle.bodyMSemiBold,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
              error: (failure) =>
                  SizedBox.shrink(key: ValueKey(state.sessionState)),
            ),
          ),
        );
      },
    );
  }
}
