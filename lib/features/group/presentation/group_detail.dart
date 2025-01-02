import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/dialog_helpers.dart';
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
    return Scaffold(
      body: BlocBuilder<GroupDetailCubit, GroupDetailState>(
        builder: (context, state) {
          return state.when(
            loadingState: () => const Center(
              child: CircularProgressIndicator(),
            ),
            errorState: (failure) => Txt(failure.toString()),
            loadedState: (loadedStateData) {
              final RenderBox overlay =
                  Overlay.of(context).context.findRenderObject() as RenderBox;

              final size = MediaQuery.sizeOf(context);
              return Stack(
                children: [
                  CustomScrollView(slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor:
                          context.theme.appColors.backgroundPrimary,
                      expandedHeight: kToolbarHeight + 10,
                      flexibleSpace: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CommonWidgets.backButton(context),
                                InkWell(
                                  onTap: () {
                                    // AutoRouter.of(context).push(
                                    //     GroupDetailsViewRoute(
                                    //         groupDetails: widget.groupDetail));
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
                                            color: context.theme.appColors
                                                .formBackground),
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
                            Row(
                              children: [
                                if (loadedStateData
                                        .session?.isCreatedByCurrentUser ??
                                    false)
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
                                                .deleteSession(loadedStateData
                                                    .session?.docId);
                                          },
                                          onCanceled: () {});
                                    },
                                  ),
                                const HorizontalSpacing(15),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: (loadedStateData.session
                                              ?.isCreatedByCurrentUser ??
                                          false)
                                      ? CommonWidgets.coloredTextButton(context,
                                          height: 40,
                                          buttonPadding: 10,
                                          text: ' Save  ',
                                          onPressed: () {})
                                      // : Txt(
                                      //     'SessionBy: ${loadedStateData.members?.firstWhere((e) => e.uid == loadedStateData.session?.startedBy).displayName}'),
                                      : Txt('helo'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: CategoriesSelector(
                          groupId: widget.groupDetail?.uid ?? '',
                          loadedStateData: loadedStateData),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(10),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              2, // You can change the number of columns here
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final item = loadedStateData.items?[index];
                            return ItemDisplayContainer(
                              loadedStateData: loadedStateData,
                              item: item,
                            );
                          },
                          childCount: loadedStateData.items?.length ?? 0,
                        ),
                      ),
                    ),
                  ]),
                  if (loadedStateData.selectedCategory?.isNotEmpty ?? false)
                    Positioned(
                        bottom: 15,
                        right: 15,
                        child: CommonWidgets.iconButton(
                            color: context.theme.appColors.primary,
                            onPressed: () {
                              AutoRouter.of(context).push(AddItemRoute(
                                  groupDetails: widget.groupDetail,
                                  categoryDetail: loadedStateData.categories
                                      ?.firstWhere((e) =>
                                          e.uid ==
                                          loadedStateData.selectedCategory)));
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            )))
                ],
              );
            },
          );
        },
      ),
    );
  }
}
