import 'package:test_app/core/constants/media_paths.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/constants/request_constants.dart';
import 'package:test_app/services/local_services/secure_storage.dart';
import 'package:test_app/services/network_services/api_services.dart';
import 'package:test_app/services/network_services/auth_service.dart';
import 'package:test_app/services/network_services/user_service.dart';

final getIt = GetIt.instance;

void getItInit() {
  getIt.registerSingleton<MediaPaths>(MediaPaths());
  getIt.registerSingleton<SecureStorage>(SecureStorage());
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<UserService>(UserService());
   getIt.registerSingleton<RequestConstants>(RequestConstants());
}
