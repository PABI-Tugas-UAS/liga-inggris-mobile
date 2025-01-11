import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/club/club_controller.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_screen_layout.dart';
import 'package:liga_inggris_mobile/presentation/screens/club/partials/section_achievements.dart';
import 'package:liga_inggris_mobile/presentation/screens/club/partials/section_players.dart';
import 'package:liga_inggris_mobile/presentation/screens/club/partials/section_prev_matches.dart';

class ClubDetailScreen extends GetView<ClubController> {
  final String clubId;

  const ClubDetailScreen({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    return CustomScreenLayout(
      goBackTitle: "Club List",
      children: [
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.clubDetails.value == null) {
            return const Center(child: Text('Failed to load match details'));
          }

          return _screenContent();
        }),
      ],
    );
  }

  Widget _screenContent() {
    final clubDetails = controller.clubDetails.value!;
    return Column(
      children: [
        ClubLogoWidget(
          imageUrl: clubDetails.logo,
          width: 120,
          height: 120,
        ),
        const SizedBox(height: 8),
        Text(
          clubDetails.name,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        const Text(
          "Pertandingan Terakhir",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        SectionPreviousMatches(matches: clubDetails.previousMatches),
        const SizedBox(height: 24),
        const Text(
          "Prestasi Club",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        SectionAchievements(achievements: clubDetails.achievements),
        const SizedBox(height: 24),
        const Text(
          "List Pemain & Pelatih",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        SectionPlayers(players: clubDetails.players),
        const SizedBox(height: 24),
      ],
    );
  }
}
