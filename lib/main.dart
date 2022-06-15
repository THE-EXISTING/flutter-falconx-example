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
  );
}

CatcherOptions setupCatcherReleaseOptions() =>
    CatcherOptions.getDefaultReleaseOptions();
CatcherOptions setupCatcherDebugOptions() =>
    CatcherOptions.getDefaultDebugOptions();
