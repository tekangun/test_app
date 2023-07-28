import 'package:flutter/material.dart';
import 'package:test_app/core/constants/media_paths.dart';
import 'package:test_app/core/init/get_it_init.dart';
import 'package:test_app/models/user_list_model.dart';
import 'package:test_app/services/network_services/user_service.dart';

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

class UserListCard extends StatelessWidget {
  const UserListCard({
    super.key,
    required this.user,
  });

  final Data user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: ListTile(
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                user.avatar ?? '',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(getIt<MediaPaths>().logoPath),
              )),
          title: Text('${user.firstName} ${user.lastName}'),
          subtitle: Text(user.email ?? ''),
        ),
      ),
    );
  }
}
