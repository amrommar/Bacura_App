import 'package:bacura_app/core/utils/index.dart';

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r, String message) : super(requestOptions: r, message: message);

  @override
  String toString() {
    return message ?? AppStrings.wrongOrder;
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r, String message) : super(requestOptions: r, message: message);

  @override
  String toString() {
    return message ?? AppStrings.serverError;
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r, String message) : super(requestOptions: r, message: message);

  @override
  String toString() {
    return message ?? AppStrings.error;
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r, String message) : super(requestOptions: r, message: message);

  @override
  String toString() {
    return message ?? AppStrings.notExist;
  }
}
