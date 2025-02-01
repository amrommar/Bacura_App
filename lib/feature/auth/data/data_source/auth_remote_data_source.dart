import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/index.dart';

abstract class BaseAuthRemoteDataSource {
  Future<void> login(LoginParameter loginParameter);

  Future<VerifyDataEntity> verify({required VerifyParameter verifyParameter});

  Future<void> completeProfileData(CompleteParameter completeParameter);
}

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  @override
  Future<void> login(LoginParameter loginParameter) async {
    await ApiClient().apiCall(
      requestType: RequestType.POST,
      url: ApiEndPoint.loginPath,
      body: loginParameter.toMap(),
    );
  }

  @override
  Future<VerifyDataEntity> verify({required VerifyParameter verifyParameter}) async {
    var response = await ApiClient().apiCall(
      requestType: RequestType.POST,
      url: ApiEndPoint.verifyPath,
      body: verifyParameter.toMap(),
    );

    return APIResponse<VerifyDataEntity>.fromJson(response?.data, (data) {
      return VerifyDataModel.fromJson(data);
    }).data!;
  }

  @override
  Future<void> completeProfileData(CompleteParameter completeParameter) async {
    await ApiClient().apiCall(
      requestType: RequestType.PATCH,
      url: ApiEndPoint.completeProfilePath,
      body: completeParameter.toMap(),
    );
  }
}
