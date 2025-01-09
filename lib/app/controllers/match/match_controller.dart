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
  var currentMatches = RxList<MatchModel>([]);
  var isCurrentMatchesLoading = false.obs;
  var upcomingMatches = RxList<MatchModel>([]);
  var isUpcomingMatchesLoading = false.obs;

  Future<void> fetchMatches() async {
    matches.clear();
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

  Future<void> fetchCurrentMatches() async {
    currentMatches.clear();
    isCurrentMatchesLoading(true);
    final res = await _matchService.getCurrentMatches();

    if (res.isSuccess) {
      currentMatches.assignAll(res.data ?? []);
    } else {
      Get.snackbar(
        'Current Matches',
        res.errMessage ?? 'Failed to fetch current matches',
        snackPosition: SnackPosition.TOP,
      );
    }

    isCurrentMatchesLoading(false);
  }

  Future<void> fetchUpcomingMatches() async {
    upcomingMatches.clear();
    isUpcomingMatchesLoading(true);
    final res = await _matchService.getUpcomingMatches();

    if (res.isSuccess) {
      upcomingMatches.assignAll(res.data ?? []);
    } else {
      Get.snackbar(
        'Upcoming Matches',
        res.errMessage ?? 'Failed to fetch upcoming matches',
        snackPosition: SnackPosition.TOP,
      );
    }

    isUpcomingMatchesLoading(false);
  }
}
