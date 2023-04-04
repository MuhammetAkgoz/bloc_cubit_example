import 'package:intl/intl.dart';
import 'package:neo_flutter_base/core/constants/currency.dart';

abstract class CurrencyAmountUtil {
  static final _trNumberFormat = NumberFormat.currency(locale: 'eu', symbol: CurrencyConstant.TL_CURRENCY);
  static final _trNumberFormatWithoutIcon = NumberFormat.currency(locale: 'eu', symbol: 'TL');
  static final currencyFormatter = NumberFormat("#,###,###.00", "en_US");

  /// get num value parameter and convert into turkish type amount format
  static String addTLSymbol(num? amount) {
    return amount != null ? _trNumberFormat.format(amount) : '-';
  }

  static String addTL(double? amount) {
    return _trNumberFormatWithoutIcon.format(amount);
  }

  static String format(double? amount) {
    return currencyFormatter.format(amount);
  }
}
