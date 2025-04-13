import 'package:bacura_app/core/localization/app_localization.dart';
import 'package:bacura_app/core/utils/index.dart';

class TimeOutException extends DioException {
  TimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return tr(AppStrings.timeOutPleaseTryAgain);
  }
}
