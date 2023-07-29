import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/widgets/text_box_with_icon.dart';
import 'package:test_app/view_models/todo_list_screen_view_model.dart';

class DialogService {
  Future<void> showFullScreenLoadingDialog() async {
    return await showCupertinoModalPopup(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Stack(
              children: [
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                ),
              ],
            ),
          );
        });
  }

  Future<String?> addJobDialog() async {
    var jobNameController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add To List'),
            contentPadding: EdgeInsets.zero,
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: TextBoxWithIcon(
                  controller: jobNameController,
                  textColor: Colors.black,
                  hintText: 'Job Name',
                  icon: Icons.checklist,
                  borderColor: Colors.grey.shade800,
                  borderRadius: 30,
                ),
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('Cancel'),
                onPressed: () {
                  Get.back();
                },
              ),
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('Add'),
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    var todoListViewModel = Get.find<TodoListScreenViewModel>();
                    todoListViewModel.addJob(name: jobNameController.text);
                    Get.back();
                  }
                },
              ),
            ],
          );
        });
  }
}
