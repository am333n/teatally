import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/features/home/application/home_page_cubit.dart';
import 'package:teatally/features/home/application/home_page_state.dart';
import 'package:teatally/features/home/presentation/components/add%20group/add_group_dialog.dart';

class SearchAndAddButtonHeader extends StatefulWidget {
  const SearchAndAddButtonHeader({super.key});

  @override
  State<SearchAndAddButtonHeader> createState() =>
      _SearchAndAddButtonHeaderState();
}

class _SearchAndAddButtonHeaderState extends State<SearchAndAddButtonHeader> {
  late SearchController searchController;
  late FocusNode _searchFocus;
  @override
  void initState() {
    searchController = SearchController();
    _searchFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: kToolbarHeight + 10,
      collapsedHeight: kToolbarHeight + 10,
      elevation: 0,
      shape: RoundedRectangleBorder(
          side: BorderSide(
        width: 0, // important
        color: context.theme.appColors.backgroundPrimary,
      )),
      flexibleSpace: Container(
          color: context.theme.appColors.backgroundPrimary,
          // color: Colors.amber,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
            child: Row(
              children: [
                Expanded(
                  child: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: searchController,
                    builder: (context, value, child) {
                      return SearchBar(
                        hintText: 'Search',
                        focusNode: _searchFocus,
                        elevation: WidgetStateProperty.all(0),
                        controller: searchController,
                        leading: const Icon(Icons.search),
                        backgroundColor: WidgetStateProperty.all(
                          context.theme.appColors.formBorder,
                        ),
                        trailing: value.text.isNotEmpty
                            ? [
                                IconButton(
                                  onPressed: () {
                                    searchController.clear();
                                    _searchFocus.unfocus();
                                    context
                                        .read<HomePageCubit>()
                                        .search(""); // Reset the search
                                  },
                                  icon: const Icon(Icons.close),
                                )
                              ]
                            : null,
                        onSubmitted: (value) {
                          context.read<HomePageCubit>().search(value);
                        },
                      );
                    },
                  ),
                ),
                const HorizontalSpacing(10),
                BlocBuilder<HomePageCubit, HomePageState>(
                  builder: (context, state) {
                    return SizedBox(
                      child: Center(
                        child: CommonWidgets.iconButton(
                          color: context.theme.appColors.formBorder,
                          onPressed: () async {
                            await context
                                .read<HomePageCubit>()
                                .getAllUsers()
                                .then((users) {
                              showGeneralDialog(
                                context: context,
                                pageBuilder: (context, _, __) {
                                  return SafeArea(
                                    child: Material(
                                      child: AddGroupDialog(users: []),
                                    ),
                                  );
                                },
                              );
                            });
                          },
                          icon: state.maybeWhen(
                            orElse: () => false,
                            loaded: (loadedStateData) =>
                                (loadedStateData.isButtonLoading ?? false),
                          )
                              ? const CupertinoActivityIndicator()
                              : const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
