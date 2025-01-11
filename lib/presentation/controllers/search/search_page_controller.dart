import 'dart:async';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/club/club_controller.dart';

class SearchPageController extends GetxController {
  SearchPageController();

  final ClubController clubController = Get.find();
  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    Future.microtask(() => clubController.fetchClubs());
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (query.isEmpty) {
        clubController.fetchClubs();
      } else {
        clubController.fetchClubs(params: {'name': query});
      }
    });
  }

  void goToClubDetail(int clubId) {
    clubController.fetchClubDetails(clubId.toString());

    Get.toNamed('/clubs/$clubId');
  }
}
