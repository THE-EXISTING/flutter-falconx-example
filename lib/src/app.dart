// import 'package:core/app.dart';
// import 'package:flutter_falconx_example/core/core.dart';
// import 'package:flutter_falconx_example/src/home/home.dart';

// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:core/app.dart';
import 'package:flutter_falconx_example/l10n/l10n.dart';
import 'package:flutter_falconx_example/src/home/home.dart';

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final GoRouter _router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (BuildContext context, state) => const HomePage(),
//       ),
//     ],
//   );

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routeInformationParser: _router.routeInformationParser,
//       routerDelegate: _router.routerDelegate,
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
//         colorScheme: ColorScheme.fromSwatch(
//           accentColor: const Color(0xFF13B9FF),
//         ),
//       ),
//       // localizationsDelegates: const [
//       // AppLocalizations.delegate,
//       // GlobalMaterialLocalizations.delegate,
//       // ],
//       localizationsDelegates: L10n.localizationsDelegates,
//       supportedLocales: L10n.all,
//       // supportedLocales: AppLocalizations.supportedLocales,
//     );
//   }
// }

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
    return MaterialApp(
      title: 'Flutter Demo',
      // title: Strings.counterAppBarTitle,
      supportedLocales: L10n.all,
      debugShowCheckedModeBanner: false,
      // restorationScopeId: restorationId,
      localeResolutionCallback: L10n.localeResolutionCallback,
      onGenerateTitle: (BuildContext context) => BuildConfig.APP_NAME,
      localizationsDelegates: L10n.localizationsDelegates,
      // theme: ThemeData(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
    // return MaterialApp.router(
    //   routeInformationParser: AppRouter.router.routeInformationParser,
    //   routerDelegate: AppRouter.router.routerDelegate,
    //   title: Strings.counterAppBarTitle,
    //   supportedLocales: L10n.all,
    //   restorationScopeId: restorationId,
    //   localeResolutionCallback: L10n.localeResolutionCallback,
    //   onGenerateTitle: (BuildContext context) => BuildConfig.APP_NAME,
    //   localizationsDelegates: L10n.localizationsDelegates,
    //   theme: ThemeData(),
    // );
  }
}
