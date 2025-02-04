import 'package:intl/intl.dart';

class NumberParser {
  static String convertToArabicNumbers(num number) {
    return NumberFormat.decimalPattern('ar').format(number);
  }

  static String translateNumber(String englishNumber) {
    Map<String, String> numbersMap = {
      "0": "٠",
      "1": "١",
      "2": "٢",
      "3": "٣",
      "4": "٤",
      "5": "٥",
      "6": "٦",
      "7": "٧",
      "8": "٨",
      "9": "٩",
    };
    return englishNumber.split('').map((char) {
      return numbersMap[char] ?? char;
    }).join('');
  }
}
