import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/app/utils/rank_utils.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';

class TopClubWidget extends StatelessWidget {
  final List<ClubModel> topClubs;

  const TopClubWidget({super.key, required this.topClubs});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: topClubs
          .asMap()
          .entries
          .map(
            (entry) => _TopClubCard(
              index: entry.key,
              club: entry.value,
            ),
          )
          .toList(),
    );
  }
}

class _TopClubCard extends StatelessWidget {
  final int index;
  final ClubModel club;

  const _TopClubCard({required this.index, required this.club});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: 80,
            child: ClubLogoWidget(
              imageUrl: club.logo!,
              width: 80,
              height: 80,
            ),
          ),
          Positioned(
            bottom: -5,
            child: Text(
              '${index + 1}${rankSuffix(index + 1)}',
              style: TextStyle(
                color: getRankColor(index),
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 1,
                    color: Colors.black,
                  ),
                  Shadow(
                    offset: Offset(-2, -2),
                    blurRadius: 1,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
