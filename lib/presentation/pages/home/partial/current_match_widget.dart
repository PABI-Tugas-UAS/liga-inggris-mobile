import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/presentation/common/clickable_card_widget.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/presentation/controllers/home/home_controller.dart';
import 'package:liga_inggris_mobile/services/match/model.dart';

class CurrentMatchWidget extends StatelessWidget {
  final RxList<MatchModel> currentMatch;

  const CurrentMatchWidget({
    super.key,
    required this.currentMatch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Pertandingan Saat Ini",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        _MatchCard(
          match: currentMatch.first,
        ),
      ],
    );
  }
}

class _MatchCard extends GetView<HomeController> {
  final MatchModel match;

  const _MatchCard({
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    return ClickableCard(
      onTap: () => controller.goToMatchDetail(match.id),
      color: AppColors.cardBackground,
      child: DefaultTextStyle(
        style: TextStyle(color: AppColors.text),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 24,
                ),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 8,
                    ),
                    child: Center(
                      child: _ClubMatch(match: match),
                    ),
                  ),
                ),
              ),
            ),
            _MatchLocation(location: match.location),
            _MatchStartTime(time: match.time),
          ],
        ),
      ),
    );
  }
}

class _ClubMatch extends StatelessWidget {
  final MatchModel match;

  const _ClubMatch({required this.match});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _Club(
          logo: match.homeClub.logo!,
          name: match.homeClub.name!,
        ),
        Text(
          ' ${match.homeScore}  -  ${match.awayScore} ',
          style: const TextStyle(fontSize: 24),
        ),
        _Club(
          logo: match.awayClub.logo!,
          name: match.awayClub.name!,
        ),
      ],
    );
  }
}

class _Club extends StatelessWidget {
  final String logo;
  final String name;

  const _Club({required this.logo, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClubLogoWidget(
            imageUrl: logo,
            width: 80,
            height: 80,
          ),
          const SizedBox(height: 6),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

class _MatchLocation extends StatelessWidget {
  final String location;

  const _MatchLocation({required this.location});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 18,
      left: 0,
      right: 0,
      child: Center(
        child: Text(location),
      ),
    );
  }
}

class _MatchStartTime extends StatelessWidget {
  final String time;

  const _MatchStartTime({required this.time});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 18,
      left: 0,
      right: 0,
      child: Center(
        child: Column(
          children: [
            const Text(
              "Start time:",
              style: TextStyle(fontSize: 9),
            ),
            Text(time),
          ],
        ),
      ),
    );
  }
}
