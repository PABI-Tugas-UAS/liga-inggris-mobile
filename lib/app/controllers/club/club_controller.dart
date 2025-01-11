import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/types/types.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';
import 'package:liga_inggris_mobile/services/club/service.dart';

class ClubController extends GetxController {
  ClubController();

  final ClubService _clubService = ClubService();
  var isLoading = false.obs;
  var clubs = RxList<ClubModel>([]);
  var topClubs = RxList<ClubModel>([]);
  var searchClub = Rxn<ClubModel>();
  var clubDetails = Rxn<ClubDetailModel>();

  Future<void> fetchClubs({QueryParams? params}) async {
    isLoading(true);
    clubs.clear();
    final res = await _clubService.getClubs(params: params);

    if (res.isSuccess) {
      clubs.assignAll(res.data ?? []);
    } else {
      Get.snackbar(
        'Clubs',
        res.errMessage ?? 'Failed to fetch clubs',
        snackPosition: SnackPosition.TOP,
      );
    }
    isLoading(false);
  }

  Future<void> fetchClubDetails(String clubId) async {
    isLoading(true);
    clubDetails.value = null;
    final res = await _clubService.getClubDetails(clubId);

    if (res.isSuccess) {
      clubDetails.value = res.data;
    } else {
      Get.snackbar(
        'Club Details',
        res.errMessage ?? 'Failed to fetch club details',
        snackPosition: SnackPosition.TOP,
      );
    }
    isLoading(false);
  }

  Future<void> fetchTopClubs() async {
    isLoading(true);
    topClubs.clear();
    final res = await _clubService.getTopClubs();

    if (res.isSuccess) {
      topClubs.assignAll(res.data ?? []);
    } else {
      Get.snackbar(
        'Top Clubs',
        res.errMessage ?? 'Failed to fetch top clubs',
        snackPosition: SnackPosition.TOP,
      );
    }
    isLoading(false);
  }
}
