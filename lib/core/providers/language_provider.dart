import 'package:bacura_app/core/utils/index.dart';

class LanguageProvider extends ChangeNotifier {
  String appLanguage = AppStrings.ar;

  void changeLanguage() {
    if (appLanguage == AppStrings.ar) {
      appLanguage = AppStrings.en;
    } else if (appLanguage == AppStrings.en) {
      appLanguage = AppStrings.ar;
    }
    notifyListeners();
  }
}
