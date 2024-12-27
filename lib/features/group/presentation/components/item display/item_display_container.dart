import 'package:flutter/material.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/features/group/domain/group_details_state_model.dart';
import 'package:teatally/features/group/domain/item_model.dart';
import 'package:teatally/features/group/domain/session_model.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/counter_button.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/item_background.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/item_label.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/member_selection_display.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/total_display.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/color_mapper.dart';

class ItemDisplayContainer extends StatelessWidget {
  const ItemDisplayContainer(
      {super.key, required this.loadedStateData, this.item});
  final GroupDetailsLoadedStateModel loadedStateData;
  final ItemModel? item;
  @override
  Widget build(BuildContext context) {
    final bgColor = ColorMapper.hexToColor(item?.color).withOpacity(0.8);
    final size = MediaQuery.of(context).size;
    final darkerColor = bgColor.withOpacity(0.3); // Adjust opacity for darkness
    return Stack(
      children: [
        ItemBackground(
            bgColor: bgColor, darkerColor: darkerColor, size: size, item: item),
        Align(
          alignment: Alignment.centerRight,
          child: ItemTotalDisplay(
            item: item,
            selectedItems: loadedStateData.session?.selectedItems,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemLabel(item: item),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, top: 15),
              child: MemberSelectionsDisplay(
                loadedStateData: loadedStateData,
                item: item,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(22),
                    bottomLeft: Radius.circular(12))),
            child: RichText(
              text: TextSpan(
                children: [
                  txtSpan(
                    context,
                    text: '₹',
                    style: TxtStyle.bodySRegular,
                  ),
                  txtSpan(
                    context,
                    text: item?.price.toString() ?? '0',
                    style: TxtStyle.bodySRegular,
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CounterButton(
            item: item,
            selectedItems: loadedStateData.session?.selectedItems,
          ),
        ),
      ],
    );
  }
}
