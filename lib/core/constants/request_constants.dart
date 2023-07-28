import 'package:test_app/view_models/login_screen_view_model.dart';

import '../../models/request_model.dart';
import 'enums/request_method.dart';

class RequestConstants{
    RequestModel getLoginRequest({required LoginScreenViewModel loginScreenViewModel}) => RequestModel(
        path: '/api/login',
        requestMethod: RequestMethod.post,
        body: {
          'email':loginScreenViewModel.emailController.text,
          'password': loginScreenViewModel.passwordControler.text
        },
      );
}