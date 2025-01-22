import 'package:bacura_app/core/utils/index.dart';

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r, String message) : super(requestOptions: r, message: message);

  @override
  String toString() {
    return message ?? 'طلب خاطئ';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r, String message) : super(requestOptions: r, message: message);

  @override
  String toString() {
    return message ?? 'خطاء في الخادم';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r, String message) : super(requestOptions: r, message: message);

  @override
  String toString() {
    return message ?? 'خطاء';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r, String message) : super(requestOptions: r, message: message);

  @override
  String toString() {
    return message ?? 'لا يوجد';
  }
}
