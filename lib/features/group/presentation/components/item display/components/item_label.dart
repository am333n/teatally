import 'package:flutter/material.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/features/group/domain/item_model.dart';

import 'package:teatally/features/home/domain/beverages.dart';

class ItemLabel extends StatelessWidget {
  const ItemLabel({
    super.key,
    required this.item,
  });

  final ItemModel? item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Txt(
            item?.name ?? '-',
            style: TxtStyle.headerMRegular,
            maxLines: 2,
          ),
        ),
        if (item?.tags?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Wrap(
              spacing: 5, // Space between containers
              runSpacing: 5, // Space between rows
              children: item!.tags!.map((tag) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Txt(
                    tag,
                    style: TxtStyle.bodyMRegular,
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
