import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/app_animations.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/dialog_helpers.dart';
import 'package:teatally/features/expense/application/cubit/expense_cubit.dart';
import 'package:teatally/features/group/application/cubit/group_detail_cubit.dart';
import 'package:teatally/features/group/application/cubit/group_detail_state.dart';
import 'package:teatally/features/group/presentation/components/categories_selector.dart';
import 'package:teatally/features/group/presentation/components/item%20display/item_display_container.dart';
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
                        Expanded(child: SessionControls())
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CategoriesSelector(
                    groupId: widget.groupDetail?.uid ?? '',
                  ),
                ),
                ItemsListing(),
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

class ItemsListing extends StatelessWidget {
  const ItemsListing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailCubit, GroupDetailState>(
      builder: (context, state) {
        return state.itemsState.when(
          loading: () => SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          loaded: (data) {
            if (data.isEmpty) {
              return SliverFillRemaining(
                  child: Center(
                      child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: NoItemPlaceHolder(
                    image: 'assets/bevimages/biscuit.gif',
                    label: 'Your list is feeling a little empty'),
              )));
            }
            return SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      2, // You can change the number of columns here
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = data[index];
                    return ItemDisplayContainer(
                      key: ValueKey(item.uid),
                      item: item,
                    );
                  },
                  childCount: data?.length ?? 0,
                ),
              ),
            );
          },
          error: (failure) => Center(child: Txt(failure.toString())),
        );
      },
    );
  }
}

class SessionControls extends StatelessWidget {
  const SessionControls({
    super.key,
  });

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
                  return SizedBox.shrink();
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
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
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
                        HorizontalSpacing(5),
                        Expanded(
                          child: Txt(
                            data.startedByName ?? 'Unknown',
                            overflow: TextOverflow.ellipsis,
                            style: TxtStyle.bodyMSemiBold,
                          ),
                        )
                      ],
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
