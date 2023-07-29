import 'package:get/get.dart';
import 'package:test_app/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoListScreenViewModel extends GetxController {
  var todoList = <TodoModel>[].obs;

  bool todoStatus({required String? uuid}) {
    var whereList = todoList.where((element) => element.uuid == uuid);
    var status = false;
    if (whereList.isNotEmpty) {
      status = whereList.first.jobStatus ?? false;
    }
    return status;
  }

  void addJob({required String name}) {
    var uuid = const Uuid().v1();
    todoList.add(TodoModel(
      uuid: uuid,
      jobName: name,
    ));
  }

  void removeJob({required String? uuid}) {
    todoList.removeWhere((element) => element.uuid == uuid);
  }

  void changeJobStatus({required String? uuid, bool? status}) {
    var todoIndex = todoList.indexWhere((element) => element.uuid == uuid);
    if (todoIndex != -1) {
      todoList[todoIndex].jobStatus = status ?? (!(todoList[todoIndex].jobStatus ?? false));
      todoList.refresh();
    }
  }
}
