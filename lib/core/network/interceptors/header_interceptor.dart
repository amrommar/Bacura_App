import 'package:bacura_app/core/utils/index.dart';

/// This interceptor used to manage the request headers.
class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      // if (UserManager.accessToken != null) ...{
      //   NetworkConstants.authorizationKey: 'Bearer ${UserManager.accessToken}',
      // },
    });
    options.headers.removeWhere((key, value) => value == null);
    handler.next(options);
  }
}
