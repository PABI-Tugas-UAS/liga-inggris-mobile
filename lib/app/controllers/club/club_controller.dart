import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/types/types.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';
import 'package:liga_inggris_mobile/services/club/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClubController extends GetxController {
  ClubController();

  final ClubService _clubService = ClubService();
  var isLoading = false.obs;
  var clubs = RxList<ClubModel>([]);
  var topClubs = RxList<ClubModel>([]);
  var searchClub = RxList<ClubModel>([]);
  var clubDetails = Rxn<ClubDetailModel>();
  var favoriteClubs = <String>{}.obs;

  Future<void> fetchClubs({QueryParams? params}) async {
    isLoading(true);
    if (params == null) {
      clubs.clear();
      final res = await _clubService.getClubs();
      if (res.isSuccess) {
        clubs.assignAll(res.data ?? []);
      } else {
        Get.snackbar(
          'Clubs',
          res.errMessage ?? 'Failed to fetch clubs',
          snackPosition: SnackPosition.TOP,
        );
      }
    } else {
      searchClub.clear();
      final res = await _clubService.getClubs(params: params);
      if (res.isSuccess) {
        searchClub.assignAll(res.data ?? []);
      } else {
        Get.snackbar(
          'Search Clubs',
          res.errMessage ?? 'Failed to fetch clubs',
          snackPosition: SnackPosition.TOP,
        );
      }
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

  void toggleFavorite(String clubId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> savedFavClubs = prefs.getStringList('favoriteClubs') ?? [];

    if (favoriteClubs.contains(clubId)) {
      favoriteClubs.remove(clubId);
      savedFavClubs.remove(clubId);
    } else {
      favoriteClubs.add(clubId);
      savedFavClubs.add(clubId);
    }

    await prefs.setStringList('favoriteClubs', savedFavClubs);
  }

  bool isFavorite(String clubId) {
    return favoriteClubs.contains(clubId);
  }
}
