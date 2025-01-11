import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/services/player/model.dart';

class SectionPlayers extends StatelessWidget {
  final List<PlayerModel> players;

  const SectionPlayers({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 2,
      runSpacing: 2,
      children: players.map((player) => _playerCard(player)).toList(),
    );
  }

  Widget _playerCard(PlayerModel player) {
    return FractionallySizedBox(
      widthFactor: 0.28,
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          color: AppColors.cardBackground,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Positioned(
                top: 15,
                child: Icon(
                  Icons.person,
                  size: 45,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 8,
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Center(
                          child: Text(
                            player.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Text(player.position),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
