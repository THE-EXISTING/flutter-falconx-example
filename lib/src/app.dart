import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';
import 'package:flutter_falconx_example/l10n/l10n.dart';

class MyApp extends ApplicationX {
  const MyApp() : super(key: const Key('MyApplication'));

  static Future<void> setupBeforeRunApp() async {
    await FlutterConfig.loadEnvVariables();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    EquatableConfig.stringify = BuildConfig.DEBUG;
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
      supportedLocales: L10n.all,
      restorationScopeId: 'MyApplication',
      localeResolutionCallback: L10n.localeResolutionCallback,
      onGenerateTitle: (context) => FlutterConfig.get('APP_NAME') as String,
      localizationsDelegates: L10n.localizationsDelegates,
      theme: ThemeData(),
    );
  }
}
