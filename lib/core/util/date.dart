import 'package:intl/intl.dart';
import 'package:neo_flutter_base/core/extension/date.dart';
import 'package:neo_flutter_base/core/util/neo_logger.dart';

abstract class DateUtil {
  static final DateFormat _YYYYMMDDDateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
  static final DateFormat _DDMMYYYYHHmmDateFormat = DateFormat("dd/MM/yyyy HH:mm");
  static final DateFormat _DDMMYYYYDateFormat = DateFormat("dd/MM/yyyy");
  static String unExpectedDate = "01/01/0001";

  static DateTime parseDate(String stringDate) {
    try {
      return _YYYYMMDDDateFormat.parse(stringDate);
    } catch (e) {
      NeoLogger.instance.e(e.toString());
    }
    return DateTime.now();
  }

  /// todo: will change name
  static DateTime parseDateOtherFormat(String stringDate) {
    try {
      return _DDMMYYYYDateFormat.parse(stringDate);
    } catch (e) {
      NeoLogger.instance.e(e.toString());
    }
    return DateTime.now();
  }

  static String formatDate(String? stringDate) {
    try {
      return _DDMMYYYYHHmmDateFormat.format(parseDate(stringDate ?? ""));
    } catch (e) {
      NeoLogger.instance.e(e.toString());
    }
    return "";
  }

  static String formatDateWithoutTime(DateTime? date) {
    try {
      return _DDMMYYYYDateFormat.format(date!);
    } catch (e) {
      NeoLogger.instance.e(e.toString());
    }
    return "";
  }

  static String parseDateWithoutTime(String? stringDate) {
    try {
      return _DDMMYYYYDateFormat.format(parseDate(stringDate ?? ""));
    } catch (e) {
      NeoLogger.instance.e(e.toString());
    }
    return "";
  }

  static String getMonthName(String? stringDate) {
    try {
      return parseDate(stringDate ?? '').monthName;
    } catch (e) {
      NeoLogger.instance.e(e.toString());
    }
    return "";
  }

  /// Converting [stringDate] to service format
  static String convertServiceDateFormat(String stringDate) => _YYYYMMDDDateFormat.format(_DDMMYYYYDateFormat.parse(stringDate));
}
