import 'package:test_app/core/constants/media_paths.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/services/local_services/secure_storage.dart';

final getIt = GetIt.instance;

void getItInit() {
  getIt.registerSingleton<MediaPaths>(MediaPaths());
  getIt.registerSingleton<SecureStorage>(SecureStorage());
}
