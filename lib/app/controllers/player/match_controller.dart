import 'package:get/get.dart';
import 'package:liga_inggris_mobile/services/player/model.dart';
import 'package:liga_inggris_mobile/services/player/service.dart';

class PlayerController extends GetxController {
  PlayerController();

  final PlayerService _playerService = PlayerService();
  var players = RxList<PlayerModel>([]);
  var isPlayersLoading = false.obs;

  Future<void> fetchMatches() async {
    isPlayersLoading(true);
    final res = await _playerService.getPlayers();

    if (res.isSuccess) {
      players.assignAll(res.data ?? []);
    } else {
      Get.snackbar(
        'Players',
        res.errMessage ?? 'Failed to fetch players',
        snackPosition: SnackPosition.TOP,
      );
    }

    isPlayersLoading(false);
  }
}
