import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/app_migration/app_migration.dart';

part 'app_migration_event.dart';
part 'app_migration_state.dart';

class AppMigrationBloc extends BlocBloc<AppMigrationEvent, AppMigrationState> {
  AppMigrationBloc({AppMigrationDatabase? appMigrationDatabase})
      : _appMigrationDatabase = appMigrationDatabase ?? AppMigrationDatabase(),
        super(AppMigrationInitial());

  final AppMigrationDatabase _appMigrationDatabase;

  @override
  Future<void> onListenEvent(AppMigrationEvent event) async {
    if (event is AppMigrationVersionChecked) {
      await _onMigrationChecked();
    }
  }

  Future<void> _onMigrationChecked() async {
    emitState(AppMigrationLoading());
    final package = await PackageInfo.fromPlatform();
    final packageFromDb = await _appMigrationDatabase.loadEntity();
    final versionName = package.version;
    final buildNumber = package.buildNumber;
    if (packageFromDb.versionName != versionName ||
        packageFromDb.buildNumber != buildNumber) {
      await _appMigrationDatabase.deleteAll();
      await _appMigrationDatabase.saveEntity(
        buildNumber: buildNumber,
        versionName: versionName,
      );
    }
    emitState(AppMigrationFinished());
  }
}
