import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/presentation/pages/search/partial/club_card_widget.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';

class ListClubWidget extends StatelessWidget {
  final List<ClubModel> clubs;

  const ListClubWidget({super.key, required this.clubs});

  @override
  Widget build(BuildContext context) {
    if (clubs.isEmpty) {
      return const Center(
        child: Text(
          'No clubs found',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Flexible(
      child: ListView.builder(
        itemCount: clubs.length,
        itemBuilder: (context, index) {
          return ClubCardWidget(club: clubs[index]);
        },
      ),
    );
  }
}
