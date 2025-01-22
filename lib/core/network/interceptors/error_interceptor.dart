import 'package:bacura_app/core/network/errors/bad_request_error.dart';
import 'package:bacura_app/core/network/errors/no_internet_error.dart';
import 'package:bacura_app/core/network/errors/timeout_error.dart';
import 'package:bacura_app/core/presentation/widget/custom_dialog_services.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:get/get.dart';

/// This interceptor used to manage errors ed from any request and it's the last interceptor in each request,
/// and it should  a [DioException].
class ErrorInterceptors extends Interceptor {
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      ErrorMessage? failureData = err.response?.data['error'] == null ? null : ErrorMessage.fromJson(err.response?.data['error']);
      switch (err.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          handler.reject(TimeOutException(
            err.requestOptions,
          ));
          break;
        case DioExceptionType.badResponse:
          await handleBadRequest(error: err, handler: handler, failureData: failureData);
          break;
        default:
          handler.reject(NoInternetConnectionException(
            err.requestOptions,
          ));
      }
    } catch (e) {
      handler.reject(BadRequestException(RequestOptions(path: ""), e.toString()));
    }
  }

  Future<void> handleBadRequest({
    required ErrorInterceptorHandler handler,
    required DioException error,
    ErrorMessage? failureData,
  }) async {
    switch (error.response?.statusCode) {
      case NetworkStatusCodes.unAuthorized:
        // handler.reject(UnauthorizedException(
        //   error.requestOptions,
        // ));
        await DialogWidget.showCustomDialog(
          context: Get.context!,
          title: failureData?.message ?? ' خطاء',
          buttonText: 'ok',
        );
        break;

      case NetworkStatusCodes.notFound:
        handler.reject(NotFoundException(
          error.requestOptions,
          failureData?.message ?? "",
        ));
        break;

      case NetworkStatusCodes.conflict:
        handler.reject(ConflictException(
          error.requestOptions,
          failureData?.message ?? "",
        ));
        break;

      case NetworkStatusCodes.serverSideError:
        handler.reject(InternalServerErrorException(
          error.requestOptions,
          failureData?.message ?? "",
        ));
        break;

      default:
        handler.reject(BadRequestException(
          error.requestOptions,
          failureData?.message ?? "",
        ));
    }
  }
}
