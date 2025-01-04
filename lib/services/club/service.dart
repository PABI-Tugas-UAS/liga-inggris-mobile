import 'package:liga_inggris_mobile/app/core/base/base_service.dart';
import 'package:liga_inggris_mobile/app/core/handler/service_result.dart';
import 'package:liga_inggris_mobile/app/types/types.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';

class ClubService extends BaseService {
  Future<ServiceResult<List<ClubModel>>> getClubs({QueryParams? params}) async {
    final response = await get('/clubs', queryParams: params);

    if (response.success) {
      final List<ClubModel> clubs = response.data.map<ClubModel>((item) => ClubModel.fromJson(item)).toList();
      return ServiceResult.success(clubs);
    } else {
      return ServiceResult.failure(response.message);
    }
  }

  Future<ServiceResult<ClubModel>> getClubByName(String name) async {
    final response = await get('/clubs?name=$name');

    if (response.success) {
      final data = response.data;
      if (data is List && data.isNotEmpty) {
        final clubData = data[0] as Map<String, dynamic>;
        final ClubModel club = ClubModel.fromJson(clubData);
        return ServiceResult.success(club);
      } else {
        return ServiceResult.failure('Club not found');
      }
    } else {
      return ServiceResult.failure(response.message);
    }
  }
}
