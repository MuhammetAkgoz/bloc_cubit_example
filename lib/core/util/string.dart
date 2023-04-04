import 'dart:convert';


class StringUtil {
  static String empty = '';

  static bool isNullOrEmpty(String? value) {
    if (value == null) {
      return true;
    }
    return value.isEmpty;
  }

  static bool isNotNullOrEmpty(String? value) {
    if (value == null) {
      return false;
    }
    return value.isNotEmpty;
  }


  static bool validEmail(String value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }

  /// Empty String => ""
  static String get blank => '';

  static String getText(dynamic value, {String? nullableChar}) {
    if (value != null) {
      return value.toString();
    }
    return nullableChar ?? '';
  }

  static bool isUrl(String? url) {
    return Uri.tryParse(url ?? '')?.hasAbsolutePath ?? false;
  }

  static String convertToString(dynamic data) {
    return json.encode(data);
  }
}
