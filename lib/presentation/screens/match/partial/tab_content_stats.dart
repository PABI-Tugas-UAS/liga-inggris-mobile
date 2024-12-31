import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/app/utils/case_convert.dart';
import 'package:liga_inggris_mobile/app/utils/get_percentage_value.dart';
import 'package:liga_inggris_mobile/services/match/model.dart';

class TabContentStats extends StatelessWidget {
  final Map<String, StatsModel> matchStats;

  const TabContentStats({super.key, required this.matchStats});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text(
          "Overview",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            primary: false,
            itemCount: matchStats.length,
            itemBuilder: (context, index) {
              String statKey = matchStats.keys.elementAt(index);
              StatsModel statValue = matchStats[statKey]!;
              return _statsItem(statKey, statValue);
            },
          ),
        ),
      ],
    );
  }

  Widget _statsItem(String statKey, StatsModel stats) {
    List<double> percentages = calculatePercentage(stats.home, stats.away);

    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 12, left: 8, right: 8),
      child: Column(
        children: [
          // point and stats name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // description home team
              Expanded(
                flex: 1,
                child: Text(
                  stats.home.toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 14),
                ),
              ),

              // minute
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    snakeCaseToPascalString(statKey),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // description away team
              Expanded(
                flex: 1,
                child: Text(
                  stats.away.toString(),
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),

          // line bar
          Row(
            children: [
              Expanded(
                flex: percentages[0].toInt(),
                child: Container(
                  height: 3,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: percentages[1].toInt(),
                child: Container(
                  height: 3,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
