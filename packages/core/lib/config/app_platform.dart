import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppPlatform {
  static final String mode = dotenv.env['PLATFORM_MODE'] ?? 'PHONE';

  static bool get isTv => mode == 'TV';

  static bool get isIOS => !isTv && Platform.isIOS;

  static bool get isAndroid => !isTv && Platform.isAndroid;

  static bool get isTVOS => isTv && Platform.isIOS;

  static bool get isAndroidTV => isTv && Platform.isAndroid;

  static bool get isDesktop => mode == 'DESKTOP';

  static bool get isWeb => mode == 'WEB';
}
