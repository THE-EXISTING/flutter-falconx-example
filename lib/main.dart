// import 'package:falconx/falconx.dart';
// import 'package:flutter_falconx_example/bootstrap.dart';
// import 'package:flutter_falconx_example/src/app.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await bootstrap(
//     () => const MyApp(
//       key: ValueKey('T'),
//     ),
//   );
// }

import 'package:core/app.dart';
import 'package:flutter_falconx_example/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyApp.setupBeforeRunApp();
  await runApplication();
}

Future<void> runApplication({Widget? testWidget, Locale? locale}) async {
  final debugOptions = setupCatcherDebugOptions();
  final releaseOptions = setupCatcherReleaseOptions();
  Catcher(
    ensureInitialized: true,
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
    runAppFunction: () async => runApp(
      const DebugRestartWidget(
        child: MyApp(),
      ),
    ),
    // await SentryFlutter.init(
    //   (dynamic options) {},
    //   appRunner: () => runApp(
    //     const DebugRestartWidget(
    //       child: MyApp(
    //         key: ValueKey('x'),
    //       ),
    //     ),
    //   ),
    // child: AppMigration(
    //   child: MyApp(
    //     key: ValueKey('x'),
    //   ),
    // ),
    // appRunner: () {
    //   return runApp(
    //     const DebugRestartWidget(
    //       child: AppMigration(
    //         child: MyApp(
    //           key: ValueKey('x'),
    //         ),
    //       ),
    //     ),
    //   );
    // },
  );
}

CatcherOptions setupCatcherReleaseOptions() =>
    CatcherOptions.getDefaultReleaseOptions();
CatcherOptions setupCatcherDebugOptions() =>
    CatcherOptions.getDefaultDebugOptions();
