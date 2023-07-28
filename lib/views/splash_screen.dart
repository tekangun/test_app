import 'package:flutter/material.dart';
import 'package:test_app/core/constants/media_paths.dart';
import 'package:test_app/core/init/get_it_init.dart';

import '../view_models/splash_screen_view_model.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final viewModel = SplashScreenViewModel();
  @override
  Widget build(BuildContext context) {
    viewModel.checkUserAvailabe();
    return Scaffold(
      body: Center(child: Image.asset(getIt<MediaPaths>().logoPath)),
    );
  }
}
