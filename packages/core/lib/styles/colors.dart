import 'package:core/app.dart';
import 'package:flutter/material.dart';

class AppColors {
  const AppColors();

  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const red = Color.fromRGBO(255, 15, 25, 1);
  static const carnation = Color.fromRGBO(246, 108, 91, 1);

  static const text = _TextColors();
  static const icon = _IconColors();
  static const status = _StatusColors();
  static const paint = _PaintColor();
  static const primaryLight = Color.fromRGBO(253, 115, 40, 1);
  static const primary = Color.fromRGBO(250, 94, 0, 1);
  static const primaryDark = Color.fromRGBO(239, 88, 0, 1);

  static const secondaryLight = Color.fromRGBO(64, 169, 255, 1);
  static const secondary = Color.fromRGBO(24, 144, 255, 1);
  static const secondaryDark = Color.fromRGBO(9, 109, 217, 1);

  static const gradient1 = Color.fromRGBO(245, 103, 86, 1);
  static const gradient2 = Color.fromRGBO(247, 172, 42, 1);
  static const gradient = LinearGradient(
    begin: Alignment(-1, -4),
    end: Alignment(1, 4),
    colors: [
      AppColors.gradient1,
      AppColors.gradient2,
    ],
  );

  static const stateOverlayPrimary = Color.fromRGBO(255, 82, 73, 0.08);
  static const stateOverlayBlack = Color.fromRGBO(0, 0, 0, 0.06);

  static const surfaceGray = Color(0xfff6f6f6);
  static const mercuryGrey = Color.fromRGBO(240, 240, 240, 1);
  static const silverGrey = Color.fromRGBO(196, 196, 196, 1);
  static const lavender = Color.fromRGBO(255, 246, 251, 1);
  static const mintCream = Color.fromRGBO(245, 255, 252, 1);

  static const transparent = Colors.transparent;
  static const skeleton = Colors.grey;

  ///----------------------- Light Theme -----------------------///
  static const bglightMode = Color.fromRGBO(248, 248, 248, 1);
  static const bgComponentlightMode = Color.fromRGBO(255, 255, 255, 1);
  static const bgTransComponentlightMode = Color.fromRGBO(255, 255, 255, 0.96);

  static const blackActive = Color.fromRGBO(0, 0, 0, 0.87);
  static const blackInactive = Color.fromRGBO(0, 0, 0, 0.60);
  static const blackDisabled = Color.fromRGBO(0, 0, 0, 0.34);
  static const blackDivider = Color.fromRGBO(0, 0, 0, 0.12);

  static const blackLoading = blackTransparent10;

  static const blackTransparent90 = Color.fromRGBO(0, 0, 0, 0.9);
  static const blackTransparent80 = Color.fromRGBO(0, 0, 0, 0.8);
  static const blackTransparent70 = Color.fromRGBO(0, 0, 0, 0.7);
  static const blackTransparent60 = Color.fromRGBO(0, 0, 0, 0.6);
  static const blackTransparent50 = Color.fromRGBO(0, 0, 0, 0.5);
  static const blackTransparent40 = Color.fromRGBO(0, 0, 0, 0.4);
  static const blackTransparent30 = Color.fromRGBO(0, 0, 0, 0.3);
  static const blackTransparent20 = Color.fromRGBO(0, 0, 0, 0.2);
  static const blackTransparent10 = Color.fromRGBO(0, 0, 0, 0.1);
  static const blackTransparent5 = Color.fromRGBO(0, 0, 0, 0.05);
  static const smokeShader = Color.fromRGBO(168, 168, 168, 0.2);

  static ColorScheme lightScheme = ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.bgComponentlightMode,
    background: AppColors.bglightMode,
    error: AppColors.status.errorLightMode,
    onPrimary: AppColors.whiteActive,
    onSecondary: AppColors.whiteActive,
    onSurface: AppColors.blackInactive,
    onBackground: AppColors.blackInactive,
    onError: AppColors.white,
    brightness: Brightness.light,
  );

  static ThemeData lightTheme = ThemeData(
    brightness: AppColors.lightScheme.brightness,
    primaryColor: AppColors.lightScheme.primary,
    canvasColor: AppColors.lightScheme.background,
    scaffoldBackgroundColor: AppColors.lightScheme.background,
    bottomAppBarColor: AppColors.lightScheme.surface,
    cardColor: AppColors.lightScheme.surface,
    dividerColor: AppColors.lightScheme.onSurface.withOpacity(0.12),
    backgroundColor: AppColors.lightScheme.background,
    dialogBackgroundColor: AppColors.lightScheme.background,
    errorColor: AppColors.lightScheme.error,
    indicatorColor: AppColors.lightScheme.onPrimary,
    applyElevationOverlayColor: false,
    colorScheme: AppColors.lightScheme,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.lightScheme.secondary,
    ),
  );

  ///----------------------- Dark Theme -----------------------///
  static const bgDarkMode = Color.fromRGBO(15, 15, 15, 1);
  static const bgComponentDarkMode = Color.fromRGBO(10, 10, 10, 1);
  static const bgTransComponentDarkMode = Color.fromRGBO(10, 10, 10, 0.94);

  static const whiteActive = Color.fromRGBO(255, 255, 255, 1);
  static const whiteInactive = Color.fromRGBO(255, 255, 255, 0.70);
  static const whiteDisabled = Color.fromRGBO(255, 255, 255, 0.50);
  static const whiteDivider = Color.fromRGBO(255, 255, 255, 0.20);

  static const whiteLoading = whiteTransparent20;

  static const whiteTransparent90 = Color.fromRGBO(255, 255, 255, 0.9);
  static const whiteTransparent80 = Color.fromRGBO(255, 255, 255, 0.8);
  static const whiteTransparent70 = Color.fromRGBO(255, 255, 255, 0.7);
  static const whiteTransparent60 = Color.fromRGBO(255, 255, 255, 0.6);
  static const whiteTransparent50 = Color.fromRGBO(255, 255, 255, 0.5);
  static const whiteTransparent40 = Color.fromRGBO(255, 255, 255, 0.4);
  static const whiteTransparent30 = Color.fromRGBO(255, 255, 255, 0.3);
  static const whiteTransparent20 = Color.fromRGBO(255, 255, 255, 0.2);
  static const whiteTransparent10 = Color.fromRGBO(255, 255, 255, 0.1);

  static ColorScheme darkScheme = ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.bgComponentDarkMode,
    background: AppColors.bgDarkMode,
    error: AppColors.status.errorDarkMode,
    onPrimary: AppColors.whiteActive,
    onSecondary: AppColors.whiteActive,
    onSurface: AppColors.whiteInactive,
    onBackground: AppColors.whiteInactive,
    onError: AppColors.whiteActive,
    brightness: Brightness.dark,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: AppColors.darkScheme.brightness,
    primaryColor: AppColors.darkScheme.primary,
    canvasColor: AppColors.darkScheme.background,
    scaffoldBackgroundColor: AppColors.darkScheme.background,
    bottomAppBarColor: AppColors.darkScheme.surface,
    cardColor: AppColors.darkScheme.surface,
    dividerColor: AppColors.darkScheme.onSurface.withOpacity(0.12),
    backgroundColor: AppColors.darkScheme.background,
    dialogBackgroundColor: AppColors.darkScheme.background,
    errorColor: AppColors.darkScheme.error,
    indicatorColor: AppColors.darkScheme.onPrimary,
    applyElevationOverlayColor: false,
    colorScheme: AppColors.darkScheme,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.lightScheme.secondary,
    ),
  );
}

class _TextColors {
  const _TextColors();

  Color get primary => AppColors.primary;

  Color get secondary => AppColors.secondary;

  Color get normal => const Color(0xff2a1919);

  Color get blackActive => AppColors.blackActive;

  Color get blackInactive => AppColors.blackInactive;

  Color get blackDisabled => AppColors.blackDisabled;

  Color get blackDivider => AppColors.blackDivider;

  Color get whiteActive => AppColors.whiteActive;

  Color get whiteInactive => AppColors.whiteInactive;

  Color get whiteDisabled => AppColors.whiteDisabled;

  Color get whiteDivider => AppColors.whiteDivider;
}

class _IconColors {
  const _IconColors();

  Color get primary => AppColors.primary;

  Color get secondary => AppColors.secondary;

  Color get blackActive => AppColors.blackActive;

  Color get blackInactive => AppColors.blackInactive;

  Color get blackDisabled => AppColors.blackDisabled;

  Color get blackDivider => AppColors.blackDivider;

  Color get whiteActive => AppColors.whiteActive;

  Color get whiteInactive => AppColors.whiteInactive;

  Color get whiteDisabled => AppColors.whiteDisabled;

  Color get whiteDivider => AppColors.whiteDivider;
}

class _StatusColors {
  const _StatusColors();

  ///----------------------- Light Theme -----------------------///
  Color get errorLightBg => const Color.fromRGBO(255, 235, 253, 1);

  Color get errorLightMode => const Color.fromRGBO(220, 0, 77, 1);

  Color get infoLightBg => const Color.fromRGBO(221, 255, 255, 1);

  Color get infoLightMode => const Color.fromRGBO(0, 88, 220, 1);

  Color get successLightBg => const Color.fromRGBO(230, 250, 219, 1);

  Color get successLightMode => const Color.fromRGBO(0, 142, 0, 1);

  Color get warningLightBg => const Color.fromRGBO(255, 248, 231, 1);

  Color get warningLightMode => const Color.fromRGBO(244, 170, 0, 1);

  ///----------------------- Dark Theme -----------------------///

  Color get errorDarkMode => const Color.fromRGBO(255, 103, 206, 1);

  Color get infoDarkMode => const Color.fromRGBO(0, 201, 255, 1);

  Color get successDarkMode => const Color.fromRGBO(138, 251, 119, 1);

  Color get warningDarkMode => const Color.fromRGBO(255, 223, 143, 1);
}

class _PaintColor {
  const _PaintColor();

  Paint get primary => Paint()
    ..shader = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.repeated,
      colors: [
        AppColors.gradient1,
        AppColors.gradient2,
      ],
    ).createShader(const Rect.fromLTWH(0, 0, 80, 10));
}
