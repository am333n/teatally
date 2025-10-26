import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/injection/injection.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/dialog_helpers.dart';
import 'package:teatally/core/widgets/toast.dart';
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart';
import 'package:teatally/features/auth/infrastructure/credential_storage.dart';
import 'package:teatally/features/home/application/home_page_cubit.dart';
import 'package:teatally/features/home/application/home_page_state.dart';
import 'package:teatally/features/home/domain/users_model.dart';
import 'package:teatally/features/home/presentation/components/add%20group/group_form.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/color_mapper.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_mapper.dart';
import 'package:teatally/features/home/presentation/components/group_loading_shimmer.dart';

class GroupsListing extends StatelessWidget {
  const GroupsListing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(builder: (context, state) {
      return state.groupsStatus.whenOr(
          loading: () => const GroupLoadingShimmer(),
          error: (failure) => Center(
                child: Txt(FailureHandler.getErrorMessageFromFailure(failure)),
              ),
          loaded: (data) {
            if (data.isEmpty) {
              return const Center(
                child: NoItemPlaceHolder(
                  image: 'assets/bevimages/coffee.png',
                  color: AppColors.lightGreen,
                  label:
                      'Nothing to show here yet \nstart by creating a group.',
                ),
              );
            }
            return AnimatedList(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                key: ValueKey(data),
                initialItemCount: data.length ?? 0,
                itemBuilder: (context, index, aniamtion) {
                  final item = data[index];
                  final currentUser = context.currentUser;
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Slidable(
                      endActionPane:
                          ActionPane(motion: const ScrollMotion(), children: [
                        if (currentUser?.uid == item.admin)
                          SlidableAction(
                            borderRadius: BorderRadius.circular(15),
                            onPressed: (_) async {
                              final isAdmin = item.admin == currentUser?.uid;
                              if (isAdmin) {
                                await DialogHelpers.confirmDeleteDialog(
                                    context: context,
                                    onConfirmed: () {
                                      context
                                          .read<HomePageCubit>()
                                          .deleteGroup(item?.docId);
                                    },
                                    onCanceled: () {});
                              } else {
                                Toast.showErrorMessage(
                                    'No Permission : Only Admin Can Make Changes To Group');
                              }
                            },
                            backgroundColor: context.theme.appColors.danger,
                            icon: Icons.delete,
                          ),
                        if (currentUser?.uid == item.admin)
                          SlidableAction(
                            onPressed: (_) async {
                              final isAdmin = item.admin == currentUser?.uid;
                              if (isAdmin) {
                                await context
                                    .read<HomePageCubit>()
                                    .getAllUsers()
                                    .then((data) {
                                  final List<UserModel>? groupMembers = state
                                      .usersStatus
                                      .getOrNull()
                                      ?.where((user) =>
                                          item.members.contains(user.uid))
                                      .toList();

                                  AutoRouter.of(context).push(GroupFormRoute(
                                      members: groupMembers,
                                      groupDetails: item,
                                      isEdit: true));
                                  // showGeneralDialog(
                                  //   context: context,
                                  //   pageBuilder: (context, _, __) {
                                  //     return SafeArea(
                                  //       child: Material(
                                  //           child: AddGroupDialog(
                                  //         members: groupMembers,
                                  //         groupDetails: item,
                                  //         isEdit: true,
                                  //       )),
                                  //     );
                                  //   },
                                  // );
                                });
                              } else {
                                Toast.showErrorMessage(
                                    'No Permission : Only Admin Can Make Changes To Group');
                              }
                            },
                            borderRadius: BorderRadius.circular(15),
                            icon: Icons.edit,
                          ),
                        SlidableAction(
                          backgroundColor: context.theme.appColors.primary,
                          borderRadius: BorderRadius.circular(15),
                          onPressed: (context) {
                            context.read<HomePageCubit>().setPinned(
                                item?.docId, item?.isPinned ?? false);
                          },
                          icon: (item?.isPinned ?? false)
                              ? Icons.push_pin
                              : Icons.push_pin_outlined,
                        )
                      ]),
                      child: InkWell(
                        onTap: () {
                          AutoRouter.of(context)
                              .push(GroupDetailRoute(groupDetail: item));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(colors: [
                                  context.theme.appColors.cardBackground,
                                  context.theme.appColors.cardBackground,
                                ])),
                            padding: const EdgeInsets.all(10),
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip
                                  .none, // Allow content to overflow outside the Stack
                              children: [
                                // Circle in the top-left corner
                                Positioned(
                                  top:
                                      -10, // Adjust as needed to place it within the bounds
                                  left:
                                      -10, // Adjust as needed to place it within the bounds
                                  child: Transform.translate(
                                    offset: const Offset(-0, -5),
                                    child: Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: context.theme.appColors.primary
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top:
                                      -10, // Adjust as needed to place it within the bounds
                                  left:
                                      -10, // Adjust as needed to place it within the bounds
                                  child: Transform.translate(
                                    offset: const Offset(-10, -5),
                                    child: Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: context.theme.appColors.primary
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top:
                                      -10, // Adjust as needed to place it within the bounds
                                  left:
                                      -10, // Adjust as needed to place it within the bounds
                                  child: Transform.translate(
                                    offset: const Offset(-20, -5),
                                    child: Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: context.theme.appColors.primary,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          // color: Colors.amber,ß
                                          height: 40,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Image.asset(
                                              IconMapper.getPathFromCode(
                                                  item?.icon),
                                              color: context.theme.appColors
                                                  .cardBackground,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Txt(
                                              item?.name ?? '-',
                                              style: TxtStyle.headerSSemiBold,
                                            ),
                                            const VerticalSpacing(5),
                                            Row(
                                              children: [
                                                if (item.adminUserName !=
                                                    null) ...[
                                                  const Icon(
                                                    Icons
                                                        .manage_accounts_outlined,
                                                    size: 16,
                                                  ),
                                                  const HorizontalSpacing(5),
                                                  Flexible(
                                                    child: Txt(
                                                      "${item.adminUserName ?? '-'}, ",
                                                      style:
                                                          TxtStyle.bodyMRegular,
                                                      fontStyle:
                                                          FontStyle.secondary,
                                                    ),
                                                  ),
                                                  const HorizontalSpacing(10),
                                                ],
                                                Flexible(
                                                  child: Txt(
                                                    "${item?.members.length} members" ??
                                                        '-',
                                                    style:
                                                        TxtStyle.bodyMRegular,
                                                    fontStyle:
                                                        FontStyle.secondary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: (item?.isPinned ?? false)
                                              ? Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Icon(
                                                    Icons.push_pin,
                                                    color: context
                                                        .theme
                                                        .appColors
                                                        .fontSecondary,
                                                  ),
                                                )
                                              : const SizedBox())
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          });
    });
  }
}

class NoItemPlaceHolder extends StatelessWidget {
  const NoItemPlaceHolder({
    super.key,
    this.image,
    required this.label,
    this.color,
  });
  final String? image;
  final String label;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (image != null) ...[
            SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  image!,
                  color: color,
                )),
            const VerticalSpacing(10)
          ],
          Txt(
            label,
            maxLines: 3,
            style: TxtStyle.headerXSSemiBold,
          )
        ],
      ),
    );
  }
}
