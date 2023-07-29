import 'package:get/get.dart';

import '../views/todo_list_screen/todo_list_screen.dart';
import '../views/user_list_screen/user_list_screen.dart';

/// In the future, we may need to access it from the outside. For this reason, I define it with "[Get]".
class MainScreenViewModel extends GetxController {
  var currentScreen = 0.obs;
  var screens = [
    const UserListScreen(),
    const TodoListScreen(),
  ];

  void changeScreen({required int index}) {
    currentScreen.value = index;
  }
}
