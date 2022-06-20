import 'package:core/app.dart';

abstract class AppSecureLocalDatabase {
  const AppSecureLocalDatabase({
    SecureStorageX secureStorage = SecureStorageX.instance,
  }) : _secureStorage = secureStorage;
  final SecureStorageX _secureStorage;

  @protected
  Future<void> saveSecure({required String key, required String data}) =>
      _secureStorage.save(key: key, data: data);

  @protected
  Future<String> loadSecure({required String key, String? defaultData}) =>
      _secureStorage.load(key: key, defaultData: defaultData);

  @protected
  Future<void> deleteSecure({required String key}) =>
      _secureStorage.delete(key: key);

  Future<void> deleteAll() => _secureStorage.deleteAll();
}
