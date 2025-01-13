import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_page_layout.dart';
import 'package:liga_inggris_mobile/presentation/common/notification_card_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> notifications = {
      "Baru": [
        "Pertandingan Tottenham dengan Manchester City akan segera dimulai",
      ],
      "Hari ini": [
        "HOT NEWS: Liverpool vs Manchester United 2-2",
        "Jangan lewatkan pertandingan panas antar Tottenham vs Manchester City Besok",
      ],
      "7 Hari Terakhir": [
        "HOT NEWS: Wolverhampton Wanderers kalah 0-3 dari Nottingham Forest",
        "Jangan Lewatkan Pertandingan Panas Wanderes vs Nottingham Forest",
        "HOT NEWS: Brentford kalah 1-3 dari Arsenal",
        "Jangan Lewatkan Pertandingan Panas Antara Brentford vs Arsenal",
      ],
    };

    return CustomPageLayout(
      title: "Notifikasi",
      scrollableChild: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: notifications.entries.map((entry) {
                final sectionTitle = entry.key;
                final sectionNotifications = entry.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(sectionTitle),
                    const SizedBox(height: 8),
                    ...sectionNotifications.map(
                      (text) => Column(
                        children: [
                          NotificationCardWidget(text: text),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
