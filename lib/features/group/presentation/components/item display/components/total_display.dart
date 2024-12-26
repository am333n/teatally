import 'package:flutter/material.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/features/group/domain/item_model.dart';
import 'package:teatally/features/group/domain/session_model.dart';

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
    final itemCount = selectedItems
            ?.firstWhere(
              (selectedItem) => selectedItem.itemUid == item?.uid,
              orElse: () => const SelectedItem(
                  itemUid: '', itemName: '', totalCount: 0, selections: []),
            )
            .totalCount ??
        0;
    return Txt(
      'Total : $itemCount',
      style: TxtStyle.headerLBold,
    );
  }
}
