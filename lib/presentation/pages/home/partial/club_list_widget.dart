import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/presentation/common/clickable_card_widget.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/presentation/controllers/home/home_controller.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';

class ClubListWidget extends GetView<HomePageController> {
  final List<ClubModel> clubs;
  final VoidCallback onTap;

  const ClubListWidget({super.key, required this.clubs, required this.onTap});

  void _handleTapCard(ClubModel club) {
    controller.goToClubDetail(club.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Club List",
          style: TextStyle(fontSize: 18),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...clubs.map(
                (club) => _ClubListCard(
                  club: club,
                  onTap: () => _handleTapCard(club),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ClubListCard extends StatelessWidget {
  final ClubModel club;
  final VoidCallback onTap;

  const _ClubListCard({required this.club, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClickableCard(
      onTap: onTap,
      color: Colors.transparent,
      elevation: 0,
      child: DefaultTextStyle(
        style: TextStyle(color: AppColors.text),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: SizedBox(
            height: 62,
            width: 62,
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                gradient: AppColors.homeLogoBackground,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: ClubLogoWidget(
                  imageUrl: club.logo!,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
