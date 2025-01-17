import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/core/network/model/api_endoint.dart';
import 'package:bacura_app/feature/auth/domain/usecases/login_usecase.dart';

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
