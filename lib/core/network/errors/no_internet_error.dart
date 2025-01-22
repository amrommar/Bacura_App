import 'package:bacura_app/core/utils/index.dart';

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'لا يوجد اتصال بالانترنت';
  }
}
