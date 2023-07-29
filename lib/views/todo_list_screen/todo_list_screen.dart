import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/view_models/todo_list_screen_view_model.dart';
import 'package:test_app/views/todo_list_screen/components/todo_list_card.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Get.put(TodoListScreenViewModel());
    return Obx(() => viewModel.todoList.isNotEmpty
        ? ListView.builder(
            itemCount: viewModel.todoList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return TodoListCard(
                todoModel: viewModel.todoList[index],
              );
            },
          )
        : const Center(
            child: Text('There is no work to be done'),
          ));
  }
}
