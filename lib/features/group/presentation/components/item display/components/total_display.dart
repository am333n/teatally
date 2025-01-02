import 'package:flutter/material.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/styles/text/txt_styles.dart';
import 'package:teatally/features/group/domain/item_model.dart';
import 'package:teatally/features/group/domain/session_model.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/color_mapper.dart';

class ItemTotalDisplay extends StatelessWidget {
  const ItemTotalDisplay({
    super.key,
    this.item,
    this.selectedItems,
  });
  final ItemModel? item;
  final List<SelectedItem>? selectedItems;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemCount = selectedItems
            ?.firstWhere(
              (selectedItem) => selectedItem.itemUid == item?.uid,
              orElse: () => const SelectedItem(
                  itemUid: '', itemName: '', totalCount: 0, selections: []),
            )
            .totalCount ??
        0;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: AnimatedSwitcher(
        duration: Durations.medium1,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(scale: animation, child: child),
          );
        },
        child: Text('$itemCount',
            key: ValueKey(itemCount),
            style: TextStyles.getTextStyle(context, TxtStyle.headerLBold)
                .copyWith(
                    fontSize: size.width * 0.3,
                    color:
                        ColorMapper.hexToColor(item?.color).withOpacity(0.7))),
      ),
    );
  }
}
