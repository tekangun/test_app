import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/init/get_it_init.dart';
import 'package:test_app/views/splash_screen.dart';

void main() {
  getItInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
    );
  }
}
