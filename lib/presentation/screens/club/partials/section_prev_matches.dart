import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/app/controllers/match/match_controller.dart';
import 'package:liga_inggris_mobile/presentation/common/clickable_card_widget.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/services/match/model.dart';

class SectionPreviousMatches extends StatelessWidget {
  final List<MatchModel> matches;

  const SectionPreviousMatches({super.key, required this.matches});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 10,
      runSpacing: 10,
      children: matches.map((match) => _matchCard(match)).toList(),
    );
  }

  Widget _matchCard(MatchModel match) {
    void goToMatchDetail(MatchModel match) {
      Get.find<MatchController>().fetchMatchDetails(match.id.toString());

      Get.toNamed('/match/${match.id}');
    }

    return FractionallySizedBox(
      widthFactor: 0.4,
      child: ClickableCard(
        onTap: () => goToMatchDetail(match),
        color: AppColors.cardBackground,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DefaultTextStyle(
          style: TextStyle(color: AppColors.text),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  height: 30,
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClubLogoWidget(
                          imageUrl: match.homeClub.logo ?? "",
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 3,
                        child: Text(
                          match.homeClub.name ?? "???",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      Text(
                        match.homeScore.toString(),
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClubLogoWidget(
                          imageUrl: match.awayClub.logo ?? "",
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 3,
                        child: Text(
                          match.awayClub.name ?? "???",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      Text(
                        match.awayScore.toString(),
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
