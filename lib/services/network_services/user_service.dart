import 'package:test_app/models/user_list_model.dart';

import '../../core/constants/request_constants.dart';
import '../../core/init/get_it_init.dart';
import 'api_service.dart';

class UserService {
  Future<UserListModel?> getUsers() async {
    try {
      var response = await getIt<ApiService>().request(requestModel: getIt<RequestConstants>().getUsers());

      return UserListModel.fromJson(response);
    } catch (e) {
      return Future.error(e);
    }
  }
}
