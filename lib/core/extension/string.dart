import 'package:bloc_cubit_example/core/util/string.dart';

extension StringExtention on String {
  /// "5.12" => 5.12 | "5" => 5.0
  double get parseDouble {
    try {
      return double.parse(this);
    } on Exception {
      return 0;
    }
  }

  /// replace function => replaceAll(",", ".")}
  double get parseDecimal {
    try {
      return double.parse(replaceAll(',', '.'));
    } on Exception {
      return 0;
    }
  }

  /// "5" => 5
  int get parseInt {
    try {
      return int.parse(replaceAll('.', '').replaceAll(',', ''));
    } on Exception {
      return 0;
    }
  }

  /// '36.000,52' -> 36.00052
  double get parseCurrency {
    try {
      return double.parse(replaceAll(',', ''));
    } on Exception {
      return 0;
    }
  }

  /// 'Developer' -> 'r'
  String get lastCharacter {
    if (StringUtil.isNullOrEmpty(this)) return '';
    return substring(length - 1, length);
  }

  /// 'Developer' | fromLast = 2 -> 'er'
  String fromLast(int fromLast) {
    if (StringUtil.isNullOrEmpty(this)) return '';
    return substring(length - fromLast, length);
  }

  /// 'Developer' -> 'Develope'
  String get untilLastCharacter {
    if (StringUtil.isNullOrEmpty(this)) return '';
    return substring(0, length - 1);
  }

  /// 'Developer' -> 'D'
  String get firstCharacter {
    if (StringUtil.isNullOrEmpty(this)) return '';
    return substring(0, 1);
  }

  /// 'Developer' -> 'eveloper'
  String get withoutFirstCharacter {
    if (StringUtil.isNullOrEmpty(this)) return '';
    return substring(1, length);
  }

  /// '10/11/1938 09:05' => '10/11/1938-09:05'
  String get hyphensToSpace => replaceAll(RegExp('[ ]'), '-');
}
