import 'package:bacura_app/core/utils/index.dart';

abstract class BaseAuthRemoteDataSource {
  Future<void> login(LoginParameter loginParameter);
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
}
