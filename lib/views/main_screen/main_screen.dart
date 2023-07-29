import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/init/get_it_init.dart';
import 'package:test_app/services/local_services/dialog_service.dart';
import 'package:test_app/services/network_services/auth_service.dart';
import 'package:test_app/view_models/main_sceen_view_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Get.put(MainScreenViewModel());

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Test App'),
          actions: [
            IconButton(
                onPressed: () async => await getIt<AuthService>().logOut(),
                icon: const Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ))
          ],
        ),

        /// we will use [IndexedStack] because when user navigate to other page and came back, we don't want to request again for users.
        body: IndexedStack(
          index: viewModel.currentScreen.value,
          children: viewModel.screens,
        ),
        floatingActionButton: viewModel.currentScreen.value == 1
            ? FloatingActionButton(
                onPressed: () => getIt<DialogService>().addJobDialog(),
                child: const Icon(Icons.add),
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
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
