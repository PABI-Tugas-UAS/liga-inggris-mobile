import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_page_layout.dart';
import 'package:liga_inggris_mobile/presentation/pages/notifications/partial/notification_card_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPageLayout(
      title: "Notifikasi",
      scrollableChild: true,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Baru"),
                SizedBox(height: 8),
                NotificationCardWidget(
                    text:
                        "Pertandingan Tottenham dengan Mancehester City akan segera dimulai"),
                SizedBox(height: 16),
                Text("Hari ini"),
                SizedBox(height: 8),
                NotificationCardWidget(
                    text: "HOT NEWS: Liverpool vs Manchester United 2-2"),
                SizedBox(height: 8),
                NotificationCardWidget(
                    text:
                        "Jangan lewatkan pertandingan panas antar Tottenham vs Manchester City Besok"),
                SizedBox(height: 16),
                Text("7 Hari Terakhir"),
                SizedBox(height: 8),
                NotificationCardWidget(
                    text:
                        "HOT NEWS: Wolverhampton Wanderers kalah 0-3 dari Nottingham Forest"),
                SizedBox(height: 8),
                NotificationCardWidget(
                    text:
                        "Jangan Lewatkan Pertandingan Panas Wanderes vs Nottingham Forest"),
                SizedBox(height: 8),
                NotificationCardWidget(
                    text: "HOT NEWS: Brentford kalah 1-3 dari Arsenal"),
                SizedBox(height: 8),
                NotificationCardWidget(
                    text:
                        "Jangan Lewatkan Pertandingan Panas Antara Brentfor vs Arsenal"),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
