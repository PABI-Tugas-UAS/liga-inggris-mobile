import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_page_layout.dart';
import 'package:liga_inggris_mobile/presentation/controllers/match/match_page_controller.dart';
import 'package:liga_inggris_mobile/presentation/pages/match/partial/match_card_widget.dart';

class MatchPage extends GetView<MatchPageController> {
  final CupertinoTabController tabController;

  const MatchPage({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return CustomPageLayout(
      title: "Match List",
      onRefresh: controller.onPageRefresh,
      children: [
        Obx(() {
          if (controller.matchController.isMatchesLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            padding: const EdgeInsets.only(left: 12, right: 12),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.matchController.matches.length,
            itemBuilder: (context, index) {
              final match = controller.matchController.matches[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: MatchCardWidget(match: match),
              );
            },
          );
        }),
      ],
    );
  }
}
