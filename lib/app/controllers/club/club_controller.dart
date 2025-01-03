import 'package:get/get.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';
import 'package:liga_inggris_mobile/services/club/service.dart';

class ClubController extends GetxController {
  ClubController();

  final ClubService _clubService = ClubService();
  var isLoading = false.obs;
  var clubs = RxList<ClubModel>([]);
  var filteredClubs = RxList<ClubModel>([]);

  @override
  void onInit() {
    super.onInit();
    fetchClubs();
  }

  Future<void> fetchClubs() async {
    isLoading(true);
    final res = await _clubService.getClubs();

    if (res.isSuccess) {
      clubs.assignAll(res.data ?? []);
      filteredClubs.assignAll(res.data ?? []);
    } else {
      Get.snackbar(
        'Clubs',
        res.errMessage ?? 'Failed to fetch clubs',
        snackPosition: SnackPosition.TOP,
      );
    }
    isLoading(false);
  }

  void filterClubs(String searchTerm) {
    if (searchTerm.isEmpty) {
      filteredClubs.assignAll(clubs);
    } else {
      filteredClubs.assignAll(
        clubs.where((club) => 
        club.name?.toLowerCase().contains(searchTerm.toLowerCase()) 
        ?? false),
      );
    }
  }
}
