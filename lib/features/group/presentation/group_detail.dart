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
import 'package:teatally/features/group/domain/session_model.dart';
import 'package:teatally/features/group/presentation/components/categories_selector.dart';
import 'package:teatally/features/group/presentation/components/item%20display/item_display_container.dart';
import 'package:teatally/features/group/presentation/components/items_listing.dart';
import 'package:teatally/features/group/presentation/components/session_controls.dart';
import 'package:teatally/features/home/domain/group_model.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/color_mapper.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/item_background.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/counter_button.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/item_label.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_mapper.dart';
import 'package:teatally/features/home/presentation/components/groups_listing.dart';

@RoutePage()
class GroupDetailPage extends StatefulWidget {
  const GroupDetailPage({super.key, required this.groupDetail});
  final GroupModel? groupDetail;
  @override
  State<GroupDetailPage> createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends State<GroupDetailPage> {
  @override
  void initState() {
    context.read<GroupDetailCubit>().resetSelection();
    context.read<GroupDetailCubit>().startUpFunction(widget.groupDetail);

    super.initState();
  }

  @override
  void dispose() {
    if (context.mounted)
      context.read<GroupDetailCubit>().disposeSessionStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<GroupDetailCubit, GroupDetailState>(
      builder: (context, state) {
        return Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                context.read<GroupDetailCubit>().resetSelection();
                context
                    .read<GroupDetailCubit>()
                    .startUpFunction(widget.groupDetail);
              },
              child: CustomScrollView(slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: context.theme.appColors.backgroundPrimary,
                  expandedHeight: kToolbarHeight + 10,
                  flexibleSpace: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              CommonWidgets.backButton(context),
                              InkWell(
                                onTap: () {
                                  AutoRouter.of(context).push(ExpenseListRoute(
                                      groupName: widget.groupDetail?.name,
                                      groupId: widget.groupDetail?.uid));
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: kToolbarHeight - 10,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: context
                                              .theme.appColors.formBackground),
                                      child: Image.asset(
                                          IconMapper.getPathFromCode(
                                              widget.groupDetail?.icon)),
                                    ),
                                    const HorizontalSpacing(15),
                                    Txt(
                                      widget.groupDetail?.name ?? '-',
                                      style: TxtStyle.headerSSemiBold,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: SessionControls(
                          groupdetails: widget.groupDetail,
                        ))
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CategoriesSelector(
                    groupDetails: widget.groupDetail,
                    groupId: widget.groupDetail?.uid ?? '',
                  ),
                ),
                SliverToBoxAdapter(
                  child: RequestBanner(
                    data: state.sessionState.getOrNull()?.transferRequest,
                  ),
                ),
                const ItemsListing(),
              ]),
            ),
            if (state.selectedCategory?.isNotEmpty ?? false)
              Positioned(
                  bottom: 15,
                  right: 15,
                  child: CommonWidgets.iconButton(
                      color: context.theme.appColors.primary,
                      onPressed: () {
                        AutoRouter.of(context).push(AddItemRoute(
                            groupDetails: widget.groupDetail,
                            categoryDetail: state.categoriesState
                                .getOrNull()
                                ?.firstWhere(
                                    (e) => e.uid == state.selectedCategory)));
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )))
          ],
        );
      },
    ));
  }
}

class RequestBanner extends StatelessWidget {
  const RequestBanner({
    super.key,
    this.data,
  });
  final TransferRequest? data;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: AppAnimations.transitionDuration,
        child: AnimatedSize(
          duration: AppAnimations.transitionDuration,
          child: data != null &&
                  data?.accepted == null &&
                  data?.orginalOwner == context.currentUser?.uid
              ? Container(
                  padding: Spacing.all,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: RoundedCorner.large,
                      color: AppColors.grey,
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.warning_amber_rounded,
                            size: Spacing.extraLarge,
                          ),
                          Gap.horizontalSmall,
                          Expanded(
                            child: RichText(
                                text: TextSpan(children: [
                              txtSpan(
                                context,
                                text: data?.requesterName?.toUpperCase(),
                                style: TxtStyle.bodyLSemiBold,
                              ),
                              txtSpan(
                                context,
                                text: ' has requested for session ownership',
                              )
                            ])),
                          ),
                        ],
                      ),
                      Gap.verticalMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buttons(
                            label: 'Reject',
                            color: Colors.white,
                            onTap: () {
                              context
                                  .read<GroupDetailCubit>()
                                  .acceptOrRejectOwnershipTransfer(false);
                            },
                          ),
                          Gap.horizontalMedium,
                          _buttons(
                            label: 'Accept',
                            color: context.theme.appColors.primary,
                            onTap: () {
                              context
                                  .read<GroupDetailCubit>()
                                  .acceptOrRejectOwnershipTransfer(true);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ));
  }

  Widget _buttons(
      {required String label, void Function()? onTap, Color? color}) {
    return InkWell(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Spacing.small / 2,
            horizontal: Spacing.medium,
          ),
          decoration:
              BoxDecoration(color: color, borderRadius: RoundedCorner.medium),
          child: Txt(
            label,
            style: TxtStyle.bodyMSemiBold,
          ),
        ),
      ),
    );
  }
}
