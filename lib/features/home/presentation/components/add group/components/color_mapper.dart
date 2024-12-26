import 'package:flutter/material.dart';

class ColorMapper {
  // List of 10 predefined colors
  static const List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.teal,
    Colors.brown,
  ];

  /// Converts a Color to its hex code (e.g., #FF0000 for red)
  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }

  /// Converts a hex code string (e.g., #FF0000) to a Color
  static Color hexToColor(String? hexCode) {
    if (hexCode != null && hexCode.isNotEmpty) {
      final buffer = StringBuffer();
      if (hexCode.length == 6 || hexCode.length == 7) {
        buffer.write('FF'); // Add alpha if missing
      }
      buffer.write(hexCode.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    }
    return defaultColor;
  }

  static const defaultColor = Colors.green;
  static final defaultColorCode = colorToHex(defaultColor);

  /// Gets all colors as hex code strings
  static List<String> getAllHexColors() {
    return colors.map(colorToHex).toList();
  }
}
