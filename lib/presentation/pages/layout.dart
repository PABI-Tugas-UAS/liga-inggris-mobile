import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/app/config/app_background_color.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/app/enums/tab_enum.dart';
import 'package:liga_inggris_mobile/presentation/controllers/home/home_binding.dart';
import 'package:liga_inggris_mobile/presentation/controllers/match/match_binding.dart';
import 'package:liga_inggris_mobile/presentation/pages/home/home_page.dart';
import 'package:liga_inggris_mobile/presentation/pages/match/match_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  final CupertinoTabController _tabController = CupertinoTabController();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _tabController,
      tabBar: CupertinoTabBar(
        items: TabEnums.values
            .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.title))
            .toList(),
        backgroundColor: Colors.black,
        activeColor: AppColors.iconActive,
        inactiveColor: AppColors.iconDisabled,
      ),
      tabBuilder: (context, index) {
        return BaseBackground(
          child: _buildTabContent(TabEnums.values[index]),
        );
      },
    );
  }

  Widget _buildTabContent(TabEnums type) {
    switch (type) {
      case TabEnums.home:
        HomePageBinding().dependencies();
        return HomePage(tabController: _tabController);

      case TabEnums.matches:
        MatchPageBinding().dependencies();
        return MatchPage(tabController: _tabController);

      case TabEnums.search:
        return const Center(
          child: Text('Search'),
        );

      case TabEnums.notification:
        return const Center(
          child: Text('Notification'),
        );

      case TabEnums.profile:
        return const Center(
          child: Text('Profile'),
        );
    }
  }
}
