import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/club/club_controller.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_page_app_bar.dart';
import 'package:liga_inggris_mobile/presentation/pages/search/partial/search_card_widget.dart';

class SearchPage extends GetView<ClubController> {
  final CupertinoTabController tabController;

  const SearchPage({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomPageAppBar(),
      backgroundColor: Colors.transparent,
      body: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins-Regular',
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: controller.filterClubs,
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
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return SearchCardWidget(clubs: controller.filteredClubs);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
