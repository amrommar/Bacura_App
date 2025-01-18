import 'package:bacura_app/core/network/model/api_response.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/data/models/verify_data_model.dart';
import 'package:bacura_app/feature/auth/data/models/verify_otp_model.dart';
import 'package:bacura_app/feature/auth/domain/usecases/verify_otp_usecase.dart';

abstract class BaseAuthRemoteDataSource {
  Future<void> login(LoginParameter loginParameter);
  Future<VerifyOtpEntity> verify(VerifyParameter verifyParameter);
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
  Future<VerifyOtpEntity> verify(VerifyParameter verifyParameter) async {
    var response = await ApiClient().apiCall(
      requestType: RequestType.POST,
      url: ApiEndPoint.verifyPath,
      body: verifyParameter.toMap(),
    );
    return APIResponse<VerifyOtpModel>.fromJson(response?.data, (data) {
      return VerifyOtpModel.fromMap(data);
    }).data!;
  }
}
