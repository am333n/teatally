import 'package:flutter/material.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/color_mapper.dart';

class ColorPickerWidget extends StatefulWidget {
  final Function(String, Color) onColorSelected;

  const ColorPickerWidget({Key? key, required this.onColorSelected})
      : super(key: key);

  @override
  _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  final List<Color> _colors = ColorMapper.colors;

  Color? _selectedColor;
  @override
  void initState() {
    _selectedColor = ColorMapper.defaultColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(spacing: 8.0, runSpacing: 8.0, children: [
        ..._colors.map((color) {
          final isSelected = _selectedColor == color;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedColor = color;
              });
              widget.onColorSelected(ColorMapper.colorToHex(color), color);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: isSelected
                    ? Border.all(color: Colors.black, width: 2.0)
                    : null,
              ),
            ),
          );
        }),
        SizedBox(
          width: size.width * 0.2,
        )
      ]),
    );
  }
}
