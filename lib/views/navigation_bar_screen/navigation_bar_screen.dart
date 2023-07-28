import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/view_models/navigation_bar_screen_view_model.dart';

class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Get.put(NavigationBarScreenViewModel());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test App'),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: Obx(() => viewModel.body),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: viewModel.currentScreen.value,
          onTap: (value) => viewModel.changeScreen(index: value),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Users',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'ToDo',
            ),
          ],
        ),
      ),
    );
  }
}
