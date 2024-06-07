import 'package:flutter/material.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/styles/text_widget.dart';
import 'package:teatally/home/domain/beverages.dart';

class ItemLabel extends StatelessWidget {
  const ItemLabel({
    super.key,
    required this.beverageItem,
  });

  final Beverage beverageItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Txt(
            beverageItem.name,
            style: TxtStyle.bodyHeadingNormal,
            maxLines: 2,
          ),
        ),
        if (beverageItem.label != null)
          Container(
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(22)),
            child: Txt(
              beverageItem.label ?? "-",
              style: TxtStyle.bodySemiBold,
            ),
          ),
      ],
    );
  }
}
