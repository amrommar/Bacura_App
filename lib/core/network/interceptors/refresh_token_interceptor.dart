// import 'package:bacura_app/core/utils/index.dart';
// import 'package:flutter/foundation.dart';

// /// This interceptor used to handle access token expiration and used the refresh token
// /// to generate new one
// class RefreshTokenInterceptor extends Interceptor {
//   @override
//   Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {

//       }
//       var res = await sl<RefreshAccessUseCase>()(UserManager.refreshToken ?? '');
//       res.fold((l) async {
//         await sl<LogOutUseCase>().call();
//         NavigationService.navigateTo(
//           navigationMethod: NavigationMethod.pushReplacement,
//           page: () => kIsWeb ? const MarketPlaceHomeScreen() : const HomeControlScreen(),
//         );

//         handler.next(err);
//         return;
//       }, (r) async {
//         await UserManager.setUserAuthModel(r);
//         err.requestOptions.headers[NetworkConstants.authorizationKey] = 'Bearer ${UserManager.accessToken}';
//         final cloneReq = await ApiClient.httpClient.request(err.requestOptions.path,
//             data: err.requestOptions.data,
//             queryParameters: err.requestOptions.queryParameters,
//             options: Options(
//               method: err.requestOptions.method,
//               headers: err.requestOptions.headers,
//             ));
//         handler.resolve(cloneReq);
//         return;
//       });
//     } else {
//       handler.next(err);
//     }
//   }
// }
