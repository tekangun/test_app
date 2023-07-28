import 'package:test_app/core/constants/media_paths.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getItInit() {
  getIt.registerSingleton<MediaPaths>(MediaPaths());

}