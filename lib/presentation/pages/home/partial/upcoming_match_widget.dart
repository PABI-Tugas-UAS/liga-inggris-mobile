import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/app/utils/date_convert.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/services/match/model.dart';

class UpcommingMatch extends StatelessWidget {
  final RxList<MatchModel> upcomingMatch;

  const UpcommingMatch({
    super.key,
    required this.upcomingMatch,
  });

  @override
  Widget build(BuildContext context) {
    if (upcomingMatch.isEmpty) {
      return const Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Upcoming Match",
            style: TextStyle(fontSize: 24),
          ),
          Center(
            child: Text(
              "Tidak ada pertandingan",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        _nextMatch(upcomingMatch.first),
        const SizedBox(height: 4),
        _upcomingMatch(upcomingMatch),
      ],
    );
  }

  Widget _nextMatch(MatchModel match) {
    return Column(
      children: [
        const Text(
          "Upcoming Match",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: ClubLogoWidget(
                            imageUrl: match.homeClub.logo!,
                            width: 0,
                            height: 0,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            match.homeClub.name!,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Text(
                          '-',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            match.awayClub.name!,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: ClubLogoWidget(
                            imageUrl: match.awayClub.logo!,
                            width: 0,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 15,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Hari Ini',
                ),
              ),
            ),
            Positioned(
              bottom: 14,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  '${match.time.substring(0, 5)} WIB',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _upcomingMatch(RxList<MatchModel> upcomingMatches) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (upcomingMatches.length <= 1)
          const Center(
            child: Text(
              "Tidak ada pertandingan",
              style: TextStyle(fontSize: 16),
            ),
          )
        else
          Column(
            children: List.generate(
              (upcomingMatches.length - 1) ~/ 2,
              (index) {
                final match1 = upcomingMatches[index * 2 + 1];
                final match2 = upcomingMatches[index * 2 + 2];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _matchCard(match1),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: _matchCard(match2),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _matchCard(MatchModel match) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 28,
                        height: 28,
                        child: ClubLogoWidget(
                          imageUrl: match.homeClub.logo!,
                          width: 0,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          match.homeClub.name!,
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 28,
                        height: 28,
                        child: ClubLogoWidget(
                          imageUrl: match.awayClub.logo!,
                          width: 0,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          match.awayClub.name!,
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    convertDate(match.date).substring(0, 6).toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.white,
                    height: 4,
                  ),
                  Text(
                    match.time.substring(0, 5),
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
