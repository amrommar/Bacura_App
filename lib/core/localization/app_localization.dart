import 'dart:ui';
import 'package:bacura_app/core/global/local_storage/shared_preferences_services.dart';
import 'package:get/get.dart';
import 'package:bacura_app/core/localization/utils.dart';
import 'package:bacura_app/core/utils/app_constants.dart';
import 'package:bacura_app/core/services/dependency_injection_services.dart';

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
  Future<Locale> getUserStoredLocale();
  Future setUserStoredLocale(Locale locale);
}

class AppLocalizations implements BaseAppLocalizations {
  static String defaultLocal = LanguageType.english.getLanguageCode();

  @override
  changeLocale({String? languageCode}) {
    final newLocale = languageCode == null
        ? (isArabic() ? Locale(LanguageType.english.getLanguageCode()) : Locale(LanguageType.arabic.getLanguageCode()))
        : Locale(languageCode);

    Get.updateLocale(newLocale);
    setUserStoredLocale(newLocale);
  }

  @override
  bool isArabic() {
    return getLanguageCode() == LanguageType.arabic.getLanguageCode();
  }

  @override
  bool isEnglish() {
    return getLanguageCode() == LanguageType.english.getLanguageCode();
  }

  @override
  String getLanguageCode() {
    String? locale = Get.locale?.languageCode;
    if (locale != null &&
        (locale == LanguageType.arabic.getLanguageCode() || locale == LanguageType.english.getLanguageCode())) {
      return locale;
    } else {
      return defaultLocal;
    }
  }

  @override
  Future<Locale> getUserStoredLocale() async {
    String locale = await sl<SharedPreferencesServices>().getData(
          key: AppConstants.userStoredLocale,
          dataType: DataType.string,
        ) ??
        defaultLocal;

    if (locale.contains(LanguageType.english.getLanguageCode())) {
      return Locale(LanguageType.english.getLanguageCode());
    } else {
      return Locale(LanguageType.arabic.getLanguageCode());
    }
  }

  @override
  Future setUserStoredLocale(Locale locale) async {
    await sl<SharedPreferencesServices>().saveData(
      key: AppConstants.userStoredLocale,
      value: locale.languageCode,
      dataType: DataType.string,
    );
  }
}

String tr(String key) {
  return key.tr;
}
