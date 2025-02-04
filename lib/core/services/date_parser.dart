import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateParser {
  static DateTime getCurrentUTC() {
    return DateTime.now().toUtc();
  }

  static String? convertLocalToUTC(DateTime? localDateTime) {
    return localDateTime?.toUtc().toString().replaceFirst(' ', 'T');
  }

  static String? convertDateToLocalString(DateTime? localDateTime) {
    return localDateTime?.toString().replaceFirst(' ', 'T');
  }

  static String? convertLocalStringToUTC(String localDateTime) {
    DateTime? parsedDate = DateTime.tryParse(localDateTime);
    if (parsedDate == null) {
      throw 'Time is not well-formatted in a local date time format';
    }
    return convertDateToLocalString(parsedDate.toUtc());
  }

  static DateTime? convertStringToDate(String localDateTime) {
    DateTime? parsedDate = DateTime.tryParse(localDateTime);
    if (parsedDate == null) {
      throw 'Time is not well-formatted in a local date time format';
    }
    return parsedDate;
  }

  static String? convertUTCToLocalTime(DateTime? localDateTime) {
    if (localDateTime == null) return null;
    if (!localDateTime.isUtc) {
      throw 'Time must be in utc format to be transformed to local';
    }
    return dateFormatter(localDateTime.toLocal());
  }

  static DateTime? convertUTCStringToLocalTime(String? localDateTime, {String format = "yyyy-MM-dd HH:mm:ss"}) {
    if (localDateTime == null) return null;
    var dateTime = DateFormat(format).parse(localDateTime.replaceAll('T', ' ').replaceAll('Z', ' '), true);
    return dateTime.toLocal();
  }

  static String dateFormatter(DateTime dateTime, {String format = 'dd/MM/yyyy, hh:mm:ss', String? locale}) {
    initializeDateFormatting('ar', null);
    return DateFormat(format, locale ?? 'ar').format(dateTime);
  }

  static String formatUtc(String utc, {String format = 'hh:mm a'}) =>
      dateFormatter(convertUTCStringToLocalTime(utc)!, format: format);

  static String dateFormatterWithoutTime(dynamic dateTime) {
    if (dateTime is! String && dateTime is! DateTime && dateTime != null) {
      throw "Only String and DateTime accepted";
    }
    DateTime? parsedDate = (dateTime is String) ? DateTime.tryParse(dateTime) : dateTime;
    if (parsedDate == null) throw "Date isn't in a valid format to be parsed";
    return DateFormat('dd/MM/yyyy').format(parsedDate);
  }

  static String dateFormatterOnlyTime(dynamic dateTime) {
    if (dateTime is! String && dateTime is! DateTime && dateTime != null) {
      throw "Only String and DateTime accepted";
    }

    DateTime? parsedDate;

    if (dateTime is String) {
      parsedDate = DateFormat("HH:mm:ss").parse(dateTime);
    } else {
      parsedDate = dateTime;
    }

    if (parsedDate == null) throw "Date isn't in a valid format to be parsed";

    return DateFormat('hh:mm a', 'ar').format(parsedDate).replaceAll('AM', 'صباحا').replaceAll('PM', 'مساء');
  }
}
