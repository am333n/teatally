import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/features/group/application/cubit/group_detail_cubit.dart';
import 'package:teatally/features/group/application/cubit/group_detail_state.dart';
import 'package:teatally/features/group/presentation/components/categories_selector.dart';
import 'package:teatally/features/group/presentation/components/item%20display/item_display_container.dart';
import 'package:teatally/features/home/domain/group_model.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/color_mapper.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/item_background.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/counter_button.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/item_label.dart';

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
    context.read<GroupDetailCubit>().getCategories(
          widget.groupDetail?.uid,
        );
    context.read<GroupDetailCubit>().getAllMembersDetails(
          widget.groupDetail?.members,
        );
    context
        .read<GroupDetailCubit>()
        .getItemsForGroup(widget.groupDetail?.uid, emitLoading: true);
    context
        .read<GroupDetailCubit>()
        .startListeningForActiveSession(widget.groupDetail?.uid);
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
      appBar: AppBar(
        backgroundColor: ColorMapper.hexToColor(widget.groupDetail?.color),
        title: Txt(widget.groupDetail?.name ?? '-'),
      ),
      body: BlocBuilder<GroupDetailCubit, GroupDetailState>(
        builder: (context, state) {
          return state.when(
            loadingState: () => const Center(
              child: CircularProgressIndicator(),
            ),
            errorState: (failure) => Txt(failure.toString()),
            loadedState: (loadedStateData) {
              final size = MediaQuery.sizeOf(context);
              return Stack(
                children: [
                  CustomScrollView(slivers: [
                    SliverToBoxAdapter(
                      child: CategoriesSelector(
                          groupId: widget.groupDetail?.uid ?? '',
                          loadedStateData: loadedStateData),
                    ),
                    SliverGrid(
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
                  ]),
                  if (loadedStateData.selectedCategory?.isNotEmpty ?? false)
                    Positioned(
                        bottom: 15,
                        right: 15,
                        child: CommonWidgets.iconButton(
                            color: ColorMapper.hexToColor(
                                widget.groupDetail?.color),
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
