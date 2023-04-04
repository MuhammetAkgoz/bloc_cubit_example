extension DateTimeExtension on DateTime {
  String get dayShortName {
    switch (weekday) {
      case 1:
        return 'PTSİ';
      case 2:
        return 'SALI';
      case 3:
        return 'ÇRŞ';
      case 4:
        return 'PRŞ';
      case 5:
        return 'CUM';
      case 6:
        return 'CTS';
      case 7:
        return 'PZR';
      default:
        return '';
    }
  }

  String get monthName {
    switch (month) {
      case 1:
        return 'Ocak';
      case 2:
        return 'Şubat';
      case 3:
        return 'Mart';
      case 4:
        return 'Nisan';
      case 5:
        return 'Mayıs';
      case 6:
        return 'Haziran';
      case 7:
        return 'Temmuz';
      case 8:
        return 'Ağustos';
      case 9:
        return 'Eylül';
      case 10:
        return 'Ekim';
      case 11:
        return 'Kasım';
      case 12:
        return 'Aralık';
      default:
        return '';
    }
  }

  /// You can get many year [ago]
  ///
  /// [ago] == 3 : 2012 -> 2009
  DateTime yearAgo(int ago) {
    return DateTime(year - ago, month, day);
  }
}
