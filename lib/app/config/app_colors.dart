import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/app/extensions/color.dart';

class AppColors {
  static Color primary = HexColor.withOpacity("040000", 0.33);

  static Color text = HexColor("FFFFFF");

  static Color appBarTitle = HexColor("A19FA5");
  static Color appBarBackground = HexColor("0F1012").withOpacity(0.5);

  static Color iconActive = HexColor("FFFFFF");
  static Color iconDisabled = HexColor.withOpacity("BDBDBD", 0.4);

  static Color cardBackground = HexColor("0F1012").withOpacity(0.35);
  static Color cardBorder = HexColor("FCFCFC");

  static Color contentSeparator = HexColor("FCFCFC").withOpacity(0.8);

  static Color buttonBackground = HexColor('3E2F9A').withOpacity(0.45);
}
