import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_app/core/constants/request_constants.dart';
import 'package:test_app/core/init/get_it_init.dart';
import 'package:test_app/models/login_response_model.dart';
import 'package:test_app/services/local_services/secure_storage.dart';
import 'package:test_app/services/network_services/api_services.dart';
import 'package:test_app/view_models/login_screen_view_model.dart';
import 'package:test_app/views/login_screen/login_screen.dart';

class AuthService {
  Future<LoginResponseModel?> login({required LoginScreenViewModel loginScreenViewModel}) async {
    try {
      var response = await getIt<ApiService>()
          .request(requestModel: getIt<RequestConstants>().getLoginRequest(loginScreenViewModel: loginScreenViewModel));
      var loginResponse = LoginResponseModel.fromJson(response);
      if (loginResponse.error?.isNotEmpty ?? false) {
        throw loginResponse.error!;
      }
      return loginResponse;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red, textColor: Colors.white);
      return null;
    }
  }

  Future<void> logOut() async {
    try {
      await getIt<SecureStorage>().removeUserToken();
      Get.offAll(const LoginScreen());
    } catch (e) {
      return Future.error(e);
    }
  }
}
