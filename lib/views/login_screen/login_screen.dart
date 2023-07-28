// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_app/core/constants/media_paths.dart';
import 'package:test_app/core/init/get_it_init.dart';
import 'package:test_app/view_models/login_screen_view_model.dart';

import 'components/text_box_with_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var whiteTextStyle = const TextStyle(color: Colors.white);
  var viewModel = LoginScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.size.height,
          child: Stack(
            children: [
              SizedBox(
                height: Get.size.height,
                child: Image.asset(
                  getIt<MediaPaths>().loginBackground,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Center(
                child: Column(
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 7,
                      child: Form(
                        key: viewModel.formKey,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                            child: SizedBox(
                              width: Get.size.width * .9,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: Get.size.width * .15,
                                      bottom: Get.size.width * .1,
                                    ),
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white.withOpacity(.8),
                                      ),
                                    ),
                                  ),
                                  TextBoxWithIcon(
                                    controller: viewModel.emailController,
                                    icon: Icons.email_outlined,
                                    isEmail: true,
                                    hintText: 'Email',
                                  ),
                                  TextBoxWithIcon(
                                    controller: viewModel.passwordControler,
                                    icon: Icons.lock_outline,
                                    hintText: 'Password',
                                    isPassword: true,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Forgot Password?',
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        'Create a new Account',
                                        style: whiteTextStyle,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: Get.size.width * .1),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      HapticFeedback.lightImpact();
                                      viewModel.loginCheck();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: Get.size.width * .05,
                                      ),
                                      height: Get.size.width / 8,
                                      width: Get.size.width / 1.25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
