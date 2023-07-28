import 'package:flutter/material.dart';
import 'package:test_app/core/constants/media_paths.dart';
import 'package:test_app/core/init/get_it_init.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(getIt<MediaPaths>().logoPath)),
    );
  }
}