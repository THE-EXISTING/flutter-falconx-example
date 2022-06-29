// ignore_for_file: library_private_types_in_public_api

import 'package:core/app.dart';

///
/// Primary Font Styles (Anuphan)
///

class AppTextStyle {
  static const String _primaryFont = 'Anuphan';
  // static const String _secondary = '';
  static const String _numberFont = 'Prompt';

  static const _PrimaryTextStyle primary = _PrimaryTextStyle();
  static const _NumberTextStyle number = _NumberTextStyle();
}

class _PrimaryTextStyle {
  const _PrimaryTextStyle();

  TextColorStyleX get h1 => const _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 96,
        letterSpacing: -1.5,
      );

  TextColorStyleX get h2 => const _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 60,
        letterSpacing: -0.5,
      );

  TextColorStyleX get h3 => const _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 48,
      );

  TextColorStyleX get h4 => const _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 34,
        letterSpacing: 0.5,
      );

  TextColorStyleX get h5 => const _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 24,
        letterSpacing: 0.5,
      );

  TextColorStyleX get h6 => const _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 20,
        letterSpacing: 0.25,
      );

  TextColorStyleX get title1 => const _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        letterSpacing: 0.5,
      );

  TextColorStyleX get title2 => const _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        letterSpacing: 0.5,
      );

  TextColorStyleX get body1 => const _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        letterSpacing: 0.25,
        lineHeight: 24,
      );

  TextColorStyleX get body2 => const _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        letterSpacing: 0.25,
        lineHeight: 22,
      );

  TextColorStyleX get button => const _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        letterSpacing: 0.5,
      );

  TextColorStyleX get caption1 => const _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 12,
        letterSpacing: 0.5,
      );

  TextColorStyleX get caption2 => const _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 10,
        letterSpacing: 0.5,
      );
}

///
/// Number Font Styles (Prompt)
///

class _NumberTextStyle {
  const _NumberTextStyle();

  TextColorStyleX get bigPrice => const _TextColorStyle(
        fontFamily: AppTextStyle._numberFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 24,
        letterSpacing: 0.5,
      );

  TextColorStyleX get medPrice => const _TextColorStyle(
        fontFamily: AppTextStyle._numberFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 20,
        letterSpacing: 0.5,
      );

  TextColorStyleX get price1 => const _TextColorStyle(
        fontFamily: AppTextStyle._numberFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        letterSpacing: 0.5,
      );

  TextColorStyleX get price2 => const _TextColorStyle(
        fontFamily: AppTextStyle._numberFont,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        letterSpacing: 0.5,
      );

  TextColorStyleX get like => const _TextColorStyle(
        fontFamily: AppTextStyle._numberFont,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 10,
        letterSpacing: 0.4,
      );
}

class _TextColorStyle extends TextColorStyleX {
  const _TextColorStyle({
    required super.fontFamily,
    required super.fontWeight,
    required super.fontStyle,
    required super.fontSize,
    super.letterSpacing,
    super.lineHeight,
  });

  @override
  TextStyle get primary => createTextStyle(color: AppColors.text.primary);

  @override
  TextStyle get secondary => createTextStyle(color: AppColors.text.secondary);

  @override
  TextStyle get normal => createTextStyle(color: AppColors.text.normal);

  @override
  TextStyle get blackActive =>
      createTextStyle(color: AppColors.text.blackActive);

  @override
  TextStyle get blackInactive =>
      createTextStyle(color: AppColors.text.blackInactive);

  @override
  TextStyle get blackDisabled =>
      createTextStyle(color: AppColors.text.blackDisabled);

  @override
  TextStyle get blackDivider =>
      createTextStyle(color: AppColors.text.blackDivider);

  @override
  TextStyle get whiteActive =>
      createTextStyle(color: AppColors.text.whiteActive);

  @override
  TextStyle get whiteInactive =>
      createTextStyle(color: AppColors.text.whiteInactive);

  @override
  TextStyle get whiteDisabled =>
      createTextStyle(color: AppColors.text.whiteDisabled);

  @override
  TextStyle get whiteDivider =>
      createTextStyle(color: AppColors.text.whiteDivider);

  @override
  TextStyle custom({required Color color, Paint? paint}) => createTextStyle(
        color: color,
        paint: paint,
      );

  @override
  TextStyle get secondaryLight =>
      createTextStyle(color: AppColors.secondaryLight);
}
