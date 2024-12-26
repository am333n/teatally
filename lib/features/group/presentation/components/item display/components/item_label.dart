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
          padding: const EdgeInsets.all(25.0),
          child: Txt(
            item?.name ?? '-',
            style: TxtStyle.headerMRegular,
            maxLines: 2,
          ),
        ),
        if (item?.tags?.isNotEmpty ?? false)
          Container(
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(22)),
            child: Txt(
              item?.tags?.join(',') ?? "-",
              color: context.theme.appColors.backgroundPrimary,
              style: TxtStyle.bodyLSemiBold,
            ),
          ),
      ],
    );
  }
}
