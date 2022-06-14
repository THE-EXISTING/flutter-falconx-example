// ignore_for_file: constant_identifier_names

import 'package:core/app.dart';

class AppMigrationEntity {
  AppMigrationEntity({
    required this.buildNumber,
    required this.versionName,
  });
  factory AppMigrationEntity.empty() =>
      AppMigrationEntity(buildNumber: '', versionName: '');

  factory AppMigrationEntity.fromMap(Map<String, dynamic> map) =>
      AppMigrationEntity(
        buildNumber: map[BUILD_NUMBER_FIELD] as String,
        versionName: map[VERSION_NAME_FIELD] as String,
      );

  factory AppMigrationEntity.fromJson(String json) =>
      AppMigrationEntity.fromMap(jsonDecode(json) as Map<String, dynamic>);

  final String versionName;
  final String buildNumber;

  static const String VERSION_NAME_FIELD = 'versionName';
  static const String BUILD_NUMBER_FIELD = 'buildNumber';

  String toJson() => jsonEncode(toMap());

  Map<String, String> toMap() => {
        VERSION_NAME_FIELD: versionName,
        BUILD_NUMBER_FIELD: buildNumber,
      };
}
