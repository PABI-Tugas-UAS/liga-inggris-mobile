import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/app/consts/match_const.dart';
import 'package:liga_inggris_mobile/app/controllers/match/match_controller.dart';
import 'package:liga_inggris_mobile/app/enums/match_details_tab_enum.dart';
import 'package:liga_inggris_mobile/app/utils/time_convert.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_screen_layout.dart';
import 'package:liga_inggris_mobile/presentation/screens/match/partial/tab_content_lineup.dart';
import 'package:liga_inggris_mobile/presentation/screens/match/partial/tab_content_stats.dart';
import 'package:liga_inggris_mobile/presentation/screens/match/partial/tab_content_timeline.dart';

class MatchDetailScreen extends GetView<MatchController> {
  final String matchId;
  final RxInt contentTabIndex = 0.obs;

  MatchDetailScreen({super.key, required this.matchId});

  void setContentTabIndex(int index) {
    contentTabIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreenLayout(
      goBackTitle: "Match List",
      children: [
        Obx(() {
          if (controller.isMatchDetailsLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.matchDetails.value == null) {
            return const Center(child: Text('Failed to load match details'));
          }

          return Column(
            children: [
              _screenContent(),
              _screenTabBar(setContentTabIndex),
              Obx(
                () => SizedBox(
                  height: Get.height * 0.5,
                  child: _screenTabContent(contentTabIndex.value),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _screenContent() {
    final matchDetails = controller.matchDetails.value!;
    return Column(
      children: [
        // top subtitle
        Row(
          children: [
            if (MatchStatus.current == matchDetails.status)
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text("LIVE"),
                  const SizedBox(width: 12),
                ],
              ),
            Text(
              "at ${convertToWIB(matchDetails.time)}, ${matchDetails.location}",
            ),
          ],
        ),

        // main title
        Container(
          padding: const EdgeInsets.only(top: 8),
          alignment: Alignment.centerLeft,
          child: Text(
            "${matchDetails.homeClub.name} vs ${matchDetails.awayClub.name}",
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 24),

        // logo and score
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.contentSeparator,
              ),
              bottom: BorderSide(
                color: AppColors.contentSeparator,
              ),
            ),
          ),
          padding:
              const EdgeInsets.only(top: 28, bottom: 28, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClubLogoWidget(
                imageUrl: matchDetails.homeClub.logo!,
                width: 100,
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "${matchDetails.homeScore} - ${matchDetails.awayScore}",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ClubLogoWidget(
                imageUrl: matchDetails.awayClub.logo!,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _screenTabBar(Function(int) onTap) {
    return Obx(
      () => CupertinoTabBar(
        onTap: (value) => onTap(value),
        currentIndex: contentTabIndex.value,
        backgroundColor: AppColors.primary,
        activeColor: AppColors.iconActive,
        inactiveColor: AppColors.iconDisabled,
        border: Border(
          bottom: BorderSide(
            color: AppColors.contentSeparator,
          ),
        ),
        items: [
          for (final tab in MatchDetailsTabEnums.values)
            BottomNavigationBarItem(
              icon: Text(
                tab.title,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _screenTabContent(int index) {
    switch (MatchDetailsTabEnums.values[index]) {
      case MatchDetailsTabEnums.timeline:
        return _tabContentTimeline();
      case MatchDetailsTabEnums.stats:
        return _tabContentStats();
      case MatchDetailsTabEnums.lineUp:
        return _tabContentLineUp();
    }
  }

  Widget _tabContentTimeline() {
    final matchTimeline = controller.matchDetails.value!.matchStats.timeline;
    return TabContentTimeline(matchTimeline: matchTimeline);
  }

  Widget _tabContentStats() {
    final matchStats = controller.matchDetails.value!.matchStats.stats;
    return TabContentStats(matchStats: matchStats);
  }

  Widget _tabContentLineUp() {
    final matchDetails = controller.matchDetails.value!;
    return TabContentLineup(
      homeClubId: matchDetails.homeClub.id!,
      awayClubId: matchDetails.awayClub.id!,
    );
  }
}
