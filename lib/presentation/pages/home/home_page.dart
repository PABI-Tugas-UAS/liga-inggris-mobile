import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/enums/tab_enum.dart';
import 'package:liga_inggris_mobile/app/utils/tab_utils.dart';
import 'package:liga_inggris_mobile/presentation/controllers/home/home_controller.dart';
import 'package:liga_inggris_mobile/presentation/pages/home/partial/club_list_widget.dart';
import 'package:liga_inggris_mobile/presentation/pages/home/partial/current_match_widget.dart';
import 'package:liga_inggris_mobile/presentation/pages/home/partial/top_club_widget.dart';

class HomePage extends GetView<HomeController> {
  final CupertinoTabController tabController;

  const HomePage({super.key, required this.tabController});

  void _toSearchScreen() {
    TabUtils.goToTab(
      controller: tabController,
      targetTab: TabEnums.search,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Obx(
                () {
                  if (controller.clubController.isLoading.value) {
                    return const Center(child: Text("Loading..."));
                  }

                  return CurrentMatchWidget(
                    currentMatch: controller.matchController.currentMatches,
                    onTap: _toSearchScreen,
                  );
                },
              ),

              const SizedBox(height: 28),

              Obx(
                () {
                  if (controller.clubController.isLoading.value) {
                    return const Center(child: Text("Loading..."));
                  }

                  return TopClubWidget(
                    topClubs: controller.clubController.topClubs,
                  );
                },
              ),

              const SizedBox(height: 24),

              Obx(
                () {
                  if (controller.clubController.isLoading.value) {
                    return const Center(child: Text("Loading..."));
                  }

                  return ClubListWidget(
                    clubs: controller.clubController.clubs,
                    onTap: _toSearchScreen,
                  );
                },
              ),

              // contoh redirect ke tab lain
              // ElevatedButton(
              //   onPressed: () => TabUtils.goToTab(
              //     controller: tabController,
              //     targetTab: TabEnums.matches,
              //   ),
              //   child: const Text('Go to Matches'),
              // ),

              // contoh redirect ke route lain
              // ElevatedButton(
              //   onPressed: () {
              //     controller.authController.logout();
              //   },
              //   child: const Text('Logout'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
