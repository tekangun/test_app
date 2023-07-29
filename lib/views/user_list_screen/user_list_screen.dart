import 'package:flutter/material.dart';
import 'package:test_app/core/init/get_it_init.dart';
import 'package:test_app/models/user_list_model.dart';
import 'package:test_app/services/network_services/user_service.dart';

import 'components/user_list_card.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserListModel?>(
        future: getIt<UserService>().getUsers(),
        builder: (context, AsyncSnapshot<UserListModel?> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error?.toString() ?? 'Error'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.data?.length ?? 0,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return UserListCard(user: snapshot.data!.data![index]);
            },
          );
        });
  }
}
