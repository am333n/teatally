import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';

class GroupLoadingShimmer extends StatelessWidget {
  const GroupLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Shimmer.fromColors(
              period: const Duration(milliseconds: 1000),
              baseColor: Theme.of(context).appColors.cardBackground,
              highlightColor:
                  Theme.of(context).appColors.primary.withOpacity(0.5),
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
              ),
            ),
          );
        });
  }
}
