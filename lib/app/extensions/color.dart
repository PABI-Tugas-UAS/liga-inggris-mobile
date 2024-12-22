import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  HexColor.withOpacity(final String hexColor, double opacity)
      : super(_applyOpacity(_getColorFromHex(hexColor), opacity));

  static int _applyOpacity(int color, double opacity) {
    final alpha = (opacity * 255).toInt();
    return (color & 0xFFFFFF) | (alpha << 24);
  }
}
