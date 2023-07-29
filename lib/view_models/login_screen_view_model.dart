import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/init/get_it_init.dart';
import 'package:test_app/services/local_services/secure_storage.dart';
import 'package:test_app/services/network_services/auth_service.dart';
import 'package:test_app/views/main_screen/main_screen.dart';

class LoginScreenViewModel {
  var emailController = TextEditingController();
  var passwordControler = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Future<void> loginCheck() async {
    if (formKey.currentState?.validate() ?? false) {
      var response = await getIt<AuthService>().login(loginScreenViewModel: this);
      if (response?.token?.isNotEmpty ?? false) {
        await getIt<SecureStorage>().setUserToken(token: response!.token!);
        Get.offAll(() => const MainScreen());
      }
    }
  }

  void fillDemo() {
    emailController.text = 'eve.holt@reqres.in';
    passwordControler.text = 'cityslicka';
  }
}
