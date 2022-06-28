import 'package:core/app.dart';
import 'package:core/config/app_platform.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_falconx_example/core/core.dart';
import 'package:flutter_falconx_example/firebase_options.dart';
import 'package:flutter_falconx_example/l10n/l10n.dart';

class MyApp extends ApplicationX {
  const MyApp() : super(key: const Key('MyApplication'));

  static Future<void> setupBeforeRunApp() async {
    // await FlutterConfig.loadEnvVariables();
    await dotenv.load(fileName: '.env.develop');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await SystemChrome.setPreferredOrientations([
      if (AppPlatform.isTv)
        DeviceOrientation.landscapeLeft
      else
        DeviceOrientation.portraitUp,
    ]);

    EquatableConfig.stringify = BuildConfig.DEBUG;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      supportedLocales: L10n.all,
      restorationScopeId: 'MyApplication',
      localeResolutionCallback: L10n.localeResolutionCallback,
      debugShowCheckedModeBanner: false,
      // onGenerateTitle: (context) => Platform.isAndroid || Platform.isIOS
      //     ? FlutterConfig.get('APP_NAME') as String
      //     : dotenv.env['APP_NAME'] as String,
      onGenerateTitle: (context) => dotenv.env['APP_NAME']!,
      localizationsDelegates: L10n.localizationsDelegates,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
    );
  }
}
