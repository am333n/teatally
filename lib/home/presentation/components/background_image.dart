import 'package:flutter/material.dart';
import 'package:teatally/home/domain/beverages.dart';

class ItemBackgroundImage extends StatelessWidget {
  const ItemBackgroundImage({
    super.key,
    required this.bgColor,
    required this.darkerColor,
    required this.size,
    required this.beverageItem,
  });

  final Color bgColor;
  final Color darkerColor;
  final Size size;
  final Beverage beverageItem;

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
        child: AspectRatio(
            aspectRatio: 5 / 5,
            child: Transform.translate(
                offset: Offset(size.width * 0.22, 0),
                child: Transform.scale(
                    scale: 1,
                    child: Image.asset(
                        fit: BoxFit.contain, beverageItem.imagePath)))),
      ),
    );
  }
}
