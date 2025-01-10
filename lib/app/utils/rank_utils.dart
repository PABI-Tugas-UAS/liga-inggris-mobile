import 'package:flutter/material.dart';

String rankSuffix(int number) {
  switch (number) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return '';
  }
}

Color getRankColor(int index) {
  if (index == 0) {
    return Colors.yellowAccent;
  } else if (index == 1) {
    return Colors.grey[200]!;
  } else if (index == 2) {
    return Colors.deepOrange;
  } else {
    return Colors.white;
  }
}
