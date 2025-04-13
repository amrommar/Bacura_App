import 'dart:ui';

import 'package:bacura_app/core/localization/utils.dart';
import 'package:get/get.dart';

extension LanguageTypeExtension on LanguageType {
  String getLanguageCode() {
    return languageCodes[this]!;
  }
}

abstract class BaseAppLocalizations {
  changeLocale({String? languageCode});

  bool isArabic();

  bool isEnglish();

  String getLanguageCode();
// Future<Locale> getUserStoredLocale();
// Future setUserStoredLocale(Locale locale);
}

class AppLocalizations implements BaseAppLocalizations {
  static String defaultLocal = LanguageType.english.getLanguageCode();

  /// Change language for the current application/// Save current application language in device local storage so that even if app terminated/restarted, the language doesn't change
  @override
  changeLocale({String? languageCode}) {
    languageCode == null
        ? Get.updateLocale(isEnglish()
            ? Locale(LanguageType.english.getLanguageCode())
            : Locale(LanguageType.arabic.getLanguageCode()))
        : Get.updateLocale(Locale(languageCode));
    // setUserStoredLocale(Get.locale!);
  }

  /// Check if current application language is German
  @override
  bool isArabic() {
    return getLanguageCode().toString() == LanguageType.arabic.getLanguageCode();
  }

  /// Check if current application language is English
  @override
  bool isEnglish() {
    return getLanguageCode().toString() == LanguageType.english.getLanguageCode();
  }

  /// YOU CAN USE THIS IN API CALLER TO SEND REQUEST BY LANGUAGE
  @override
  String getLanguageCode() {
    String? locale = Get.locale?.languageCode;
    if (locale != null &&
        (locale.toString() == LanguageType.arabic.getLanguageCode() ||
            locale.toString() == LanguageType.english.getLanguageCode())) {
      return locale;
    } else {
      return defaultLocal;
    }
  }
// ///Fetch stored language from device local storage for user app
// ///If there is no stored language then arabic will be used as default
// @override
// Future<Locale> getUserStoredLocale() async {
//   String locale = 'ar';
//   if (locale.contains(LanguageType.english.getLanguageCode())) {
//     return Locale(LanguageType.english.getLanguageCode());
//   } else {
//     return Locale(LanguageType.arabic.getLanguageCode());
//   }
// }
  /// Save user application language in device local storage so that even if app terminated/restarted, the language doesn't change
// @override
// Future setUserStoredLocale(Locale locale) async {
//   locale;
// }
}

String tr(String key) {
  return key.tr;
}
