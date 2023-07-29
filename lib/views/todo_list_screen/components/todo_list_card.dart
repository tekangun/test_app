import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/models/todo_model.dart';
import 'package:test_app/view_models/todo_list_screen_view_model.dart';

class TodoListCard extends StatelessWidget {
  const TodoListCard({
    super.key,
    required this.todoModel,
  });

  final TodoModel todoModel;

  @override
  Widget build(BuildContext context) {
    var viewModel = Get.find<TodoListScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: ListTile(
          onTap: () => viewModel.changeJobStatus(
            uuid: todoModel.uuid,
          ),
          leading: Checkbox(
            value: viewModel.todoStatus(uuid: todoModel.uuid),
            onChanged: (value) => viewModel.changeJobStatus(uuid: todoModel.uuid, status: value),
          ),
          title: Text(todoModel.jobName ?? 'Empty'),
          trailing: IconButton(
            icon: const Icon(
              Icons.delete_rounded,
              color: Colors.red,
            ),
            onPressed: () => viewModel.removeJob(uuid: todoModel.uuid),
          ),
        ),
      ),
    );
  }
}
