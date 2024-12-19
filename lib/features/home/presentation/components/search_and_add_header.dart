import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';

class SearchAndAddButtonHeader extends StatelessWidget {
  const SearchAndAddButtonHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
          minHeight: 50,
          maxHeight: 50,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                    child: SearchBar(
                        hintText: 'Search',
                        leading: Icon(Icons.search),
                        backgroundColor: WidgetStateProperty.all(
                          context.theme.appColors.formBorder,
                        ))),
                HorizontalSpacing(5),
                CommonWidgets.iconButton(
                    color: context.theme.appColors.formBorder,
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
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
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
