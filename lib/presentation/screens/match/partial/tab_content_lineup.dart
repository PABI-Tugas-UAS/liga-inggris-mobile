import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/app/controllers/player/player_controller.dart';
import 'package:liga_inggris_mobile/app/enums/lineup_tab_enum.dart';
import 'package:liga_inggris_mobile/services/player/model.dart';

class TabContentLineup extends GetView<PlayerController> {
  final int homeClubId;
  final int awayClubId;
  final Rx<LineupTabEnums> lineupTeam = LineupTabEnums.home.obs;

  TabContentLineup({
    super.key,
    required this.homeClubId,
    required this.awayClubId,
  });

  void changeLineupTeam() {
    if (lineupTeam.value == LineupTabEnums.home) {
      lineupTeam.value = LineupTabEnums.away;
      controller.fetchPlayers(clubId: awayClubId.toString());
    } else {
      lineupTeam.value = LineupTabEnums.home;
      controller.fetchPlayers(clubId: homeClubId.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Column(
            children: [
              const SizedBox(height: 16),
              _screenTabBar(changeLineupTeam),
              const SizedBox(height: 16),
              if (controller.isPlayersLoading.value)
                const CircularProgressIndicator(),
              if (controller.players.isEmpty &&
                  !controller.isPlayersLoading.value)
                const Center(child: Text('Failed to load player lineup')),
              Obx(
                () => SizedBox(
                  height: Get.height * 0.35,
                  child: _screenTabContent(lineupTeam.value),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _screenTabBar(void Function()? onTap) {
    bool isHome = lineupTeam.value == LineupTabEnums.home;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.toggleInactive,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              height: 35,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:
                    isHome ? AppColors.toggleActive : AppColors.toggleInactive,
              ),
              child: Center(
                  child: Text(
                'home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              )),
            ),
            Container(
              width: 150,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:
                    isHome ? AppColors.toggleInactive : AppColors.toggleActive,
              ),
              child: Center(
                  child: Text(
                'away',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _screenTabContent(LineupTabEnums team) {
    switch (team) {
      case LineupTabEnums.home:
        return _tabContentLineUp();
      case LineupTabEnums.away:
        return _tabContentLineUp();
    }
  }

  Widget _tabContentLineUp() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            primary: false,
            itemCount: controller.players.length,
            itemBuilder: (context, index) {
              final player = controller.players[index];
              return _lineupItem(player);
            },
          ),
        ),
      ],
    );
  }

  Widget _lineupItem(PlayerModel player) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 8, right: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        // nomor punggung
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Center(
                child: Text("${player.id}"),
              ),
            ),
          ),

          // nama pemain
          Expanded(
            flex: 3,
            child: Text(
              player.name,
              style: const TextStyle(fontSize: 12),
            ),
          ),

          // posisi pemain
          Container(
            constraints:
                const BoxConstraints(minWidth: 0), // Prevents extra space
            child: Text(
              player.position,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
