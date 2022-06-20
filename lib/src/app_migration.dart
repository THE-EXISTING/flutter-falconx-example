import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';

class AppMigration extends AppComponent {
  const AppMigration({super.key, required this.child});

  final Widget child;

  @override
  Widget buildDefault(BuildContext context) {
    return BlocProvider<AppMigrationBloc>(
      create: (context) =>
          AppMigrationBloc()..addAppEvent(AppMigrationVersionChecked()),
      child: Builder(
        builder: (context) {
          return BlocBuilder<AppMigrationBloc, AppMigrationState>(
            builder: (context, state) {
              if (state is AppMigrationFinished) {
                return child;
              }
              logger.i('==========> app_migration.dart');
              return AppSplashScreen.create();
            },
          );
        },
      ),
    );
  }
}
