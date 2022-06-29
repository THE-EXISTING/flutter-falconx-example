import 'dart:io';

class AppPlatform {
  static const tvMode = String.fromEnvironment('TV_MODE');

  static bool get isTv => tvMode == 'ON';
  static bool get isIOS => !isTv && Platform.isIOS;
  static bool get isAndroid => !isTv && Platform.isAndroid;
  static bool get isTVOS => isTv && Platform.isIOS;
  static bool get isAndroidTV => isTv && Platform.isAndroid;

  // static final String mode = dotenv.env['PLATFORM_MODE'] ?? 'PHONE';

  // static bool get isTv => mode == 'TV';

  // static bool get isIOS => !isTv && Platform.isIOS;

  // static bool get isAndroid => !isTv && Platform.isAndroid;

  // static bool get isTVOS => isTv && Platform.isIOS;

  // static bool get isAndroidTV => isTv && Platform.isAndroid;

  // static bool get isDesktop => mode == 'DESKTOP';

  // static bool get isWeb => mode == 'WEB';
}
