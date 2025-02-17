import 'package:bacura_app/core/utils/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HeaderInterceptor extends Interceptor {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? accessToken = await _secureStorage.read(key: AppStrings.token);

    if (accessToken != null) {
      options.headers.addAll({
        NetworkConstants.contentTypeKey: options.headers.containsKey("isMultiPartFile")
            ? NetworkConstants.multipartValue
            : NetworkConstants.jsonTypeValue,
        NetworkConstants.authorizationKey: 'Bearer $accessToken',
      });
    }

    options.headers.removeWhere((key, value) => value == null);

    handler.next(options);
  }
}
