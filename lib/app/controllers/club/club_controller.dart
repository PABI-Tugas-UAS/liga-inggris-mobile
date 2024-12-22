import 'package:get/get.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';
import 'package:liga_inggris_mobile/services/club/service.dart';

class ClubController extends GetxController {
  ClubController();
  final ClubService _clubService = ClubService();

  var isLoading = false.obs;
  var clubs = RxList<ClubModel>([]);

  Future<void> fetchClubs() async {
    isLoading(true);
    final res = await _clubService.getClubs();

    if (res.isSuccess) {
      clubs.assignAll(res.data ?? []);
    } else {
      Get.snackbar(
        'Applications by ID',
        res.errMessage ?? 'Failed to fetch clubs',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    print("fetchClubs !!!!!!!!!!!!!!");
    isLoading(false);
  }
}
