import 'package:flutter/material.dart';

class LoginScreenViewModel {
  var emailController = TextEditingController();
  var passwordControler = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Future<void> loginCheck() async {
    if (formKey.currentState?.validate() ?? false) {}
  }
}
