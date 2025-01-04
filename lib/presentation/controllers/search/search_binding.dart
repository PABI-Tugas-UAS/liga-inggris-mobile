import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/club/club_controller.dart';
import 'package:liga_inggris_mobile/presentation/controllers/search/search_page_controller.dart';

class SearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClubController());
    Get.put(SearchPageController());
  }
}