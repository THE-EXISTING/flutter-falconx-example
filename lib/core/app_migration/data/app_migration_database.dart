import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/app_migration/app_migration.dart';

class AppMigrationDatabase extends AppSecureLocalDatabase {
  static const String packageVersionKey = 'package_version';

  Future<AppMigrationEntity> loadEntity() async {
    final entity = await loadSecure(key: packageVersionKey);
    if (entity.isEmpty) return AppMigrationEntity.empty();
    return AppMigrationEntity.fromJson(entity);
  }

  Future<void> saveEntity({
    required String buildNumber,
    required String versionName,
  }) async {
    final entity =
        AppMigrationEntity(buildNumber: buildNumber, versionName: versionName);
    await saveSecure(key: packageVersionKey, data: entity.toJson());
  }

  Future<void> deleteToken() async {
    await saveSecure(key: packageVersionKey, data: '{}');
  }
}
