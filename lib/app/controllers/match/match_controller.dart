import 'package:get/get.dart';
import 'package:liga_inggris_mobile/services/match/model.dart';
import 'package:liga_inggris_mobile/services/match/service.dart';

class MatchController extends GetxController {
  MatchController();
  final MatchService _matchService = MatchService();

  var matches = RxList<MatchModel>([]);
  var isMatchesLoading = false.obs;
  var matchDetails = Rxn<MatchDetailModel>();
  var isMatchDetailsLoading = false.obs;

  Future<void> fetchMatches() async {
    isMatchesLoading(true);
    final res = await _matchService.getMatches();

    if (res.isSuccess) {
      matches.assignAll(res.data ?? []);
    } else {
      Get.snackbar(
        'Matches',
        res.errMessage ?? 'Failed to fetch matches',
        snackPosition: SnackPosition.TOP,
      );
    }

    isMatchesLoading(false);
  }

  Future<void> fetchMatchDetails(String matchId) async {
    matchDetails(null);
    isMatchDetailsLoading(true);
    final res = await _matchService.getMatchById(matchId);

    if (res.isSuccess) {
      matchDetails(res.data);
    } else {
      Get.snackbar(
        'Match Details',
        res.errMessage ?? 'Failed to fetch match details',
        snackPosition: SnackPosition.TOP,
      );
    }

    isMatchDetailsLoading(false);
  }
}
