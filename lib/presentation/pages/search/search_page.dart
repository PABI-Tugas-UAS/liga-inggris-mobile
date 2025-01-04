import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_page_layout.dart';
import 'package:liga_inggris_mobile/presentation/controllers/search/search_page_controller.dart';
import 'package:liga_inggris_mobile/presentation/pages/search/partial/search_card_widget.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';

class SearchPage extends GetView<SearchPageController> {
  final CupertinoTabController tabController;

  const SearchPage({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return CustomPageLayout(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: controller.clubController.searchClubs,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search Club',
                    hintStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                  ),
                ),
              ),
              Obx(() {
                if (controller.clubController.isLoading.value) {
                  return const CircularProgressIndicator();
                }
                return SearchCardWidget(clubs: controller.clubController.clubs);
              }),
            ],
          ),
        ),
      ],
    );
  }
}
