import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';
import 'package:liga_inggris_mobile/presentation/common/club_search_widget.dart';

class SearchCardWidget extends StatelessWidget {
  final List<ClubModel> clubs;

  const SearchCardWidget({super.key, required this.clubs});

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

    return ListView.builder(
      itemCount: clubs.length,
      itemBuilder: (context, index) {
        final club = clubs[index];
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(padding: EdgeInsets.all(16.0)),
                ClubSearchWidget(
                  imageUrl: club.logo ?? '',
                  width: 100,
                  height: 100,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: Text(
                      club.name ?? 'Unknown Club',
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.right,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
