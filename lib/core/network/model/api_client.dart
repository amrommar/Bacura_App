import 'package:bacura_app/core/network/interceptors/header_interceptor.dart';
import 'package:bacura_app/core/utils/index.dart';

enum RequestType { GET, POST, PUT, PATCH, DELETE }

/// This class is used to perform any http request, [ApiClient] take to optional arguments
///  [client] and [options].

class ApiClient {
  static late Dio httpClient;
  static LastApiErrorRecorded? lastErrorRecorded;

  ApiClient._internal();

  static final _instance = ApiClient._internal();

  /// [client] is a object from type [Dio] so you can pass a mocking dio object in case
  /// you used it in end-to-end testing.
  /// [option] used if you want to override or send custom dio options
  factory ApiClient({
    Dio? client,
    BaseOptions? options,
    String? customBaseUrl,
  }) {
    client = client ?? Dio();

    client.options = options ??
        BaseOptions(
          baseUrl: customBaseUrl ?? NetworkConstants.developmentBaseUrl,
          headers: {},
        );
    client.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 120,
        logPrint: print,
      ),
      HeaderInterceptor(),
      // RefreshTokenInterceptor(),
      // ErrorInterceptors(),
    ]);
    httpClient = client;
    return _instance;
  }

  void addInterceptors(List<Interceptor> interceptor) {
    httpClient.interceptors.addAll(interceptor);
  }

  Future<Response?>? apiCall({
    required String url,
    required RequestType requestType,
    String? token,
    String? tenantId,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Map<String, dynamic>? customHeader,
    bool isMultiPart = false,
  }) async {
    late Response result;
    Options options = Options(headers: customHeader);

    dynamic data = isMultiPart ? FormData.fromMap(body) : body;
    try {
      switch (requestType) {
        case RequestType.GET:
          {
            result = await httpClient.get(
              url,
              data: data,
              queryParameters: queryParameters,
              options: options,
            );
            break;
          }
        case RequestType.POST:
          {
            result = await httpClient.post(
              url,
              data: data,
              queryParameters: queryParameters,
              options: options,
            );
            break;
          }
        case RequestType.DELETE:
          {
            result = await httpClient.delete(
              url,
              data: data,
              queryParameters: queryParameters,
              options: options,
            );
            break;
          }
        case RequestType.PUT:
          {
            result = await httpClient.put(
              url,
              data: data,
              queryParameters: queryParameters,
              options: options,
            );
            break;
          }
        case RequestType.PATCH:
          {
            result = await httpClient.patch(
              url,
              data: data,
              queryParameters: queryParameters,
              options: options,
            );
            break;
          }
      }
      return result;
    } on DioException catch (error) {
      if (lastErrorRecorded != null &&
          lastErrorRecorded!.message == (error.message ?? error.response?.statusMessage ?? "",) &&
          DateTime.now().difference(lastErrorRecorded!.time).inSeconds < 5) {
        throw Exception(NetworkConstants.repetitiveException);
      } else {
        lastErrorRecorded = LastApiErrorRecorded(
          time: DateTime.now(),
          message: error.message ?? error.response?.statusMessage ?? "",
        );
        throw ServerFailure(
          code: error.response?.statusCode ?? 500,
          message: error.message ?? error.response?.statusMessage ?? "",
        );
      }
    } catch (error) {
      if (lastErrorRecorded != null &&
          lastErrorRecorded!.message == error.toString() &&
          DateTime.now().difference(lastErrorRecorded!.time).inSeconds < 5) {
        throw Exception(NetworkConstants.repetitiveException);
      } else {
        lastErrorRecorded = LastApiErrorRecorded(
          time: DateTime.now(),
          message: error.toString(),
        );
        throw Exception(error.toString());
      }
    }
  }
}
