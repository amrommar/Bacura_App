import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String appLanguage = 'en';

  void changeLanguage() {
    if (appLanguage == 'ar') {
      appLanguage = 'en';
    } else if (appLanguage == 'en') {
      appLanguage = 'ar';
    }
    notifyListeners();
  }
}
