import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/club/club_controller.dart';

class SearchPageController extends GetxController {
  SearchPageController();

  final ClubController clubController = Get.find();

  @override
  void onInit() {
    super.onInit();
    clubController.fetchClubs();
  }

  // void goToClubDetail(int clubId) {
  //   clubController.fetchClubs();
  //   Get.toNamed('/club/$clubId');
  // }
}