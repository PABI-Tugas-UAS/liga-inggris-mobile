import 'package:flutter/cupertino.dart';

enum TabEnums { home, matches, search, notification, profile }

extension TabItem on TabEnums {
  Icon get icon {
    const icons = {
      TabEnums.home: CupertinoIcons.home,
      TabEnums.matches: CupertinoIcons.sportscourt,
      TabEnums.search: CupertinoIcons.search,
      TabEnums.notification: CupertinoIcons.bell,
      TabEnums.profile: CupertinoIcons.person,
    };

    return Icon(icons[this]!, size: 25.0);
  }

  String get title {
    switch (this) {
      case TabEnums.home:
        return "Home";
      case TabEnums.matches:
        return "Matches";
      case TabEnums.search:
        return "Search";
      case TabEnums.notification:
        return "Notification";
      case TabEnums.profile:
        return "Profile";
    }
  }
}
