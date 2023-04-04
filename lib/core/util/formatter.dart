import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:neo_flutter_base/core/util/currency.dart';
import 'package:otp_autofill/otp_autofill.dart';

class NeoCurrencyTextInputFormatter extends TextInputFormatter {
  late final NumberFormat _formatter;

  NeoCurrencyTextInputFormatter() {
    _formatter = CurrencyAmountUtil.currencyFormatter;
  }

  String get _numberSymbol => _formatter.symbols.GROUP_SEP;

  NumberFormat getFormat() {
    return _formatter;
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    /// Handle non-number
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text == ".") {
      return newValue.copyWith(
        text: '0.00',
        selection: const TextSelection.collapsed(offset: 2),
      );

      /// Prevent non-number character except for "." & ","
    } else if (RegExp(r'[^0-9.,]').allMatches(newValue.text).isNotEmpty) {
      return oldValue;
    } else if (_getAfterPoint(newValue.text).contains('.')) {
      return oldValue;
    }

    /// Handle numbers
    else {
      double newNumber = 0;

      if ((!newValue.text.contains(".")) && oldValue.text.contains('.')) {
        String tempString = newValue.text.replaceAll(_numberSymbol, '');
        tempString = "${tempString.substring(0, tempString.length - 2)}.${tempString.substring(tempString.length - 2)}";
        newNumber = double.parse(tempString);
      } else {
        newNumber = double.parse(newValue.text.replaceAll(_numberSymbol, '').replaceAll("..", '.'));
      }

      newNumber = _getTwoDecimalAfterPoint(newNumber);

      String newString = _formatter.format(newNumber);
      int cursorPosition = 0;

      void next() => cursorPosition++;
      void back() => cursorPosition--;

      if (oldValue.text.length > newString.length) {
        /// When delete any number before point
        back();
      } else if (oldValue.text.length < newString.length) {
        /// When click any number before point
        next();
      }

      /// it works after point
      else {
        if (oldValue.text.replaceAll(_numberSymbol, '').length > newValue.text.replaceAll(_numberSymbol, '').length) {
          back();
          if (newString == "0.00" && oldValue.selection.baseOffset == 0) {
            newString = "";
          }
        } else if (oldValue.text.replaceAll(_numberSymbol, '').length <= newValue.text.replaceAll(_numberSymbol, '').length) {
          /// When click point
          next();
        } else if (oldValue.selection.extentOffset > oldValue.selection.baseOffset) {
          cursorPosition = oldValue.selection.baseOffset - oldValue.selection.extentOffset;
          newString =
              newString.substring(0, oldValue.selection.baseOffset - 1) + newString.substring(oldValue.selection.baseOffset + 1);
          newNumber = double.parse(newString.replaceAll(_numberSymbol, '').replaceAll("..", '.'));
          newString = _formatter.format(newNumber);
          if (newString == "0.00" && oldValue.selection.baseOffset == 0) {
            newString = "";
          }
        }
      }

      /// Calculate where the cursor is
      var cursorIndex = oldValue.selection.extent.offset +
          cursorPosition +
          (_numberSymbol.allMatches(newString).length - _numberSymbol.allMatches(oldValue.text).length);

      /// Prevent index out of range exception
      if (cursorIndex > newString.length) {
        cursorIndex--;
      }

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: cursorIndex),
      );
    }
  }

  /// 93,384.4449 -> 93,384.44
  double _getTwoDecimalAfterPoint(double number) {
    String temp = number.toString();
    String afterPoint = _getAfterPoint(temp);

    if (afterPoint.length >= 2) {
      /// Get two digit after point
      temp = temp.substring(0, (temp.length - (afterPoint.length - 1)));
      return double.parse(temp);
    }
    return number;
  }

  String _getAfterPoint(String text) {
    int index = text.indexOf('.');
    String afterPoint = text.substring(index + 2, text.length);
    return afterPoint;
  }
}

class SampleStrategy extends OTPStrategy {
  @override
  Future<String> listenForCode() {
    return Future.delayed(
      const Duration(seconds: 4),
      () => 'MobilDeniz Giris Sifreniz 442024. '
          'Lutfen sifrenizi banka personeli dahil kimseyle paylasmayiniz. B001',
    );
  }
}

class SmsAutofillListener {
  late OTPTextEditController controller;
  ValueChanged<String>? smsCodeListener;

  SmsAutofillListener({this.smsCodeListener}) {
    OTPInteractor().getAppSignature().then((value) => print('signature - $value'));

    /// Assign controller
    controller = OTPTextEditController(
      codeLength: 6,
    )..startListenUserConsent(
        (code) {
          /// Get six number from sms message by [RegExp(r'(\d{6})')]
          final exp = RegExp(r'(\d{6})');

          /// Retrieve sms code
          if (smsCodeListener != null) {
            smsCodeListener!(exp.stringMatch(code ?? '') ?? '');
          }
          return exp.stringMatch(code ?? '') ?? '';
        },
        //strategies: [SampleStrategy()],
      );
  }

  /// Clear all instance
  void dispose() {
    controller.dispose();
    smsCodeListener = null;
  }
}
