import 'package:flutter/cupertino.dart';
import 'package:liga_inggris_mobile/app/enums/tab_enum.dart';

class TabUtils {
  static void goToTab({
    required CupertinoTabController controller,
    required TabEnums targetTab,
  }) {
    controller.index = TabEnums.values.indexOf(targetTab);
  }
}
