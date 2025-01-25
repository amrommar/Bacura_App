import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/core/network/model/api_endoint.dart';
import 'package:bacura_app/core/network/model/api_response.dart';
import 'package:bacura_app/feature/profile/data/model/my_profile_model.dart';
import 'package:bacura_app/feature/profile/domain/entity/my_profile_entity.dart';
import 'package:bacura_app/feature/profile/domain/use_case/update_profile_use_case.dart';

abstract class BaseProfileDataSource {
  Future<MyProfileEntity> getMyProfile();
  Future<void> updateMyProfile({required UpdateProfileParameters updateProfileParameters});
}

class ProfileDataSource extends BaseProfileDataSource {
  @override
  Future<MyProfileEntity> getMyProfile() async {
    var response = await ApiClient().apiCall(requestType: RequestType.GET, url: ApiEndPoint.getMyProfilePath);
    return APIResponse<MyProfileEntity>.fromJson(response?.data, (data) {
      return MyProfileModel.fromJson(data);
    }).data!;
  }

  @override
  Future<void> updateMyProfile({required UpdateProfileParameters updateProfileParameters}) async {
    await ApiClient().apiCall(
      requestType: RequestType.PATCH,
      url: ApiEndPoint.updateMyProfilePath,
      body: updateProfileParameters.toMap(),
      isMultiPart: true,
    );
  }
}
