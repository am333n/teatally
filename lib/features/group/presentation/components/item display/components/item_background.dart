import 'package:flutter/material.dart';
import 'package:teatally/features/group/domain/item_model.dart';
import 'package:teatally/features/home/domain/beverages.dart';

class ItemBackground extends StatelessWidget {
  const ItemBackground({
    super.key,
    required this.bgColor,
    required this.darkerColor,
    required this.size,
    required this.item,
  });

  final Color bgColor;
  final Color darkerColor;
  final Size size;
  final ItemModel? item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [bgColor, darkerColor],
          ),
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }
}
