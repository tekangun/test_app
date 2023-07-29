import 'package:flutter/material.dart';

import '../../../core/constants/media_paths.dart';
import '../../../core/init/get_it_init.dart';
import '../../../models/user_list_model.dart';

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
