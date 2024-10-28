import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'ar';

  void changeLanguage() {
    if (appLanguage == 'ar') {
      appLanguage = 'en';
    } else if (appLanguage == 'en') {
      appLanguage = 'ar';
    }
    notifyListeners();
  }
}
