import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/app/consts/match_const.dart';
import 'package:liga_inggris_mobile/services/match/model.dart';

class TabContentTimeline extends StatelessWidget {
  final List<TimelineModel> matchTimeline;

  const TabContentTimeline({super.key, required this.matchTimeline});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            primary: false,
            itemCount: matchTimeline.length,
            itemBuilder: (context, index) {
              final match = matchTimeline[index];
              return _timelineItem(match);
            },
          ),
        ),
      ],
    );
  }

  Widget _timelineItem(TimelineModel timeline) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 8, right: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          // description home team
          Expanded(
            flex: 3,
            child: timeline.team == MatchTeam.home
                ? Text(
                    timeline.description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 14),
                  )
                : Container(),
          ),

          // minute
          Expanded(
            flex: 1,
            child: Text(
              "${timeline.minute}'",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // description away team
          Expanded(
            flex: 3,
            child: timeline.team == MatchTeam.away
                ? Text(
                    timeline.description,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 14),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
