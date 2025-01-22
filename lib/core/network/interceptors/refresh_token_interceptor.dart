// import 'package:bacura_app/core/utils/index.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class RefreshTokenInterceptor extends Interceptor {
//   final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       // Attempt to refresh the token
//       final refreshToken = await _secureStorage.read(key: 'refreshToken');
//       if (refreshToken != null) {
//         try {
//           final dio = Dio();
//           final response = await dio.post('https://api.example.com/refresh', data: {
//             'refresh_token': refreshToken,
//           });
//           final newAccessToken = response.data['access_token'];
//           await _secureStorage.write(key: 'token', value: newAccessToken);

//           // Retry the original request
//           err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
//           final retryResponse = await dio.fetch(err.requestOptions);
//           return handler.resolve(retryResponse);
//         } catch (e) {
//           // Handle refresh token failure
//         }
//       }
//     }
//     handler.next(err); // Forward the error if it's not a 401 or token refresh fails
//   }
// }
