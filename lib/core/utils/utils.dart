import 'package:bacura_app/core/utils/index.dart';

bool isTablet() {
  final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
  if (data.size.shortestSide < 550) {
    return false;
  } else {
    return true;
  }
}
