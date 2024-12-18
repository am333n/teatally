import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  final Function(String, Color) onColorSelected;

  const ColorPickerWidget({Key? key, required this.onColorSelected})
      : super(key: key);

  @override
  _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.cyan,
    Colors.brown,
    Colors.grey,
    Colors.pink,
  ];

  Color? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: _colors.map((color) {
          final isSelected = _selectedColor == color;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedColor = color;
              });
              widget.onColorSelected(_colorToHex(color), color);
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
        }).toList(),
      ),
    );
  }

  /// Converts a [Color] object to a HEX color code as a [String].
  String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}
