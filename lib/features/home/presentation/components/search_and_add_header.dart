import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/features/home/application/home_page_cubit.dart';
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
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
          minHeight: kToolbarHeight,
          maxHeight: kToolbarHeight,
          child: Container(
            color: context.theme.appColors.backgroundPrimary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ValueListenableBuilder<TextEditingValue>(
                      valueListenable: searchController,
                      builder: (context, value, child) {
                        return SearchBar(
                          hintText: 'Search',
                          focusNode: _searchFocus,
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
                  const HorizontalSpacing(5),
                  CommonWidgets.iconButton(
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
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
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
