import 'package:core/app.dart';

class AppCurrencyTextInputFormatter extends CurrencyTextInputFormatter {
  AppCurrencyTextInputFormatter()
      : super(
          decimalDigits: 2,
          symbol: '',
        );

  /// Fixed format original library is wrong
  /// Example:
  /// decimalDigits = 0 | [value] = '20' ==> '20'
  /// decimalDigits = 2 | [value] = '20' ==> '2000'
  /// decimalDigits = 2 | [value] = '20.1234' ==> '2012'
  /// decimalDigits = 2 | [value] = '20.1' ==> '2010'
  /// decimalDigits = 2 | [value] = '20.' ==> '2000'
  @override
  String format(String value) {
    var newValue = value;
    if ((decimalDigits ?? 0) > 0) {
      final splitValue = value.split('.');
      if (splitValue.length > 1) {
        final decimalDigitStr = splitValue[1];
        if (decimalDigitStr.isEmpty) {
          newValue = splitValue[0] + '0' * decimalDigits!;
        } else if (decimalDigitStr.length < decimalDigits!) {
          final newDecimalDigitStr =
              decimalDigitStr.slice(0, decimalDigitStr.length - 1) +
                  '0' * (decimalDigits! - 1);
          newValue = splitValue[0] + newDecimalDigitStr;
        } else {
          final newDecimalDigitStr =
              decimalDigitStr.slice(0, decimalDigits! - 1);
          newValue = splitValue[0] + newDecimalDigitStr;
        }
      } else {
        newValue = value + '0' * decimalDigits!;
      }
    }
    return super.format(newValue);
  }
}
