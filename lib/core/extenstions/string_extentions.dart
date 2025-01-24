import 'package:bacura_app/core/utils/app_constants.dart';

extension StringExtensions on String {
  String toEnglishDigits() {
    const digitsMap = AppConstants.englishDigitsMap;
    RegExp regex = RegExp('[٠-٩۳]');
    return regex.hasMatch(this) ? replaceAllMapped(regex, (m) => '${digitsMap[m[0]] ?? m[0]}') : this;
  }
}
