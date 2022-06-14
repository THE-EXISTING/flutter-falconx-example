import 'package:core/utils/app_currency_formatter.dart';
import 'package:falconx/falconx.dart';

class AppTextFieldUtils {
  // ignore: library_private_types_in_public_api
  static _AppTextFieldMaskFormatter maskFormatter =
      _AppTextFieldMaskFormatter();

  // ignore: library_private_types_in_public_api
  static _AppTextFieldListFormatter formatters =
      _AppTextFieldListFormatter(maskFormatter);
}

class _AppTextFieldListFormatter {
  _AppTextFieldListFormatter(this._maskFormatter);

  final _AppTextFieldMaskFormatter _maskFormatter;

  List<TextInputFormatter> get emailOTP => [_maskFormatter.emailOTP()];

  List<TextInputFormatter> get currency => [AppCurrencyTextInputFormatter()];

  List<TextInputFormatter> get zipCode => [
        FilteringTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter.allow(
          RegExp('^[0-9]{1,10}'),
        ),
      ];

  List<TextInputFormatter> get parcelNumber => [
        FilteringTextInputFormatter.allow(
          RegExp('^[A-Za-z0-9]{0,19}'),
        )
      ];

  List<TextInputFormatter> get merchantID => [
        FilteringTextInputFormatter.allow(RegExp('^[a-z0-9]{1,10}')),
      ];

  List<TextInputFormatter> get digitsOnly => [
        FilteringTextInputFormatter.digitsOnly,
      ];
}

class _AppTextFieldMaskFormatter {
  MaskTextInputFormatter phone({String? initialText}) => MaskTextInputFormatter(
        mask: '###-###-####',
        initialText: initialText,
        filter: {'#': RegExp('[0-9]')},
      );

  MaskTextInputFormatter emailOTP({String? initialText}) =>
      MaskTextInputFormatter(
        mask: '######',
        initialText: initialText,
        filter: {'#': RegExp('[0-9]')},
      );

  MaskTextInputFormatter citizenID({String? initialText}) =>
      MaskTextInputFormatter(
        mask: '# #### ##### ## #',
        filter: {'#': RegExp('[0-9]')},
      );
}
