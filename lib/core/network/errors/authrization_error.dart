import 'package:bacura_app/core/utils/index.dart';

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'تم انتهاء الاتصال، يرجى المحاولة مرة أخرى';
  }
}
