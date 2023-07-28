// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/constants/secure_storage_keys.dart';

class SecureStorage {
  FlutterSecureStorage get getStorage {
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    return FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  Future<void> setUserToken({required String token}) async {
    await getStorage.write(key: SecureStorageKeys.userToken, value: token);
  }

  Future<String?> getUserToken() async => await getStorage.read(key: SecureStorageKeys.userToken);

  Future<void> removeUserToken() async => await getStorage.delete(key: SecureStorageKeys.userToken);
}
