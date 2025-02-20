import 'package:bacura_app/feature/profile/index.dart';

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
