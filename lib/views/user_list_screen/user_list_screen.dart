import 'package:flutter/material.dart';
import 'package:test_app/core/constants/media_paths.dart';
import 'package:test_app/core/init/get_it_init.dart';
import 'package:test_app/models/user_list_model.dart';

class UserListScreen extends StatelessWidget {
  UserListScreen({super.key});

  final userListModel = UserListModel.fromJson({
    "page": 2,
    "per_page": 6,
    "total": 12,
    "total_pages": 2,
    "data": [
      {
        "id": 7,
        "email": "michael.lawson@reqres.in",
        "first_name": "Michael",
        "last_name": "Lawson",
        "avatar": "https://reqres.in/img/faces/7-image.jpg"
      },
      {
        "id": 8,
        "email": "lindsay.ferguson@reqres.in",
        "first_name": "Lindsay",
        "last_name": "Ferguson",
        "avatar": "https://reqres.in/img/faces/8-image.jpg"
      },
      {
        "id": 9,
        "email": "tobias.funke@reqres.in",
        "first_name": "Tobias",
        "last_name": "Funke",
        "avatar": "https://reqres.in/img/faces/9-image.jpg"
      },
      {
        "id": 10,
        "email": "byron.fields@reqres.in",
        "first_name": "Byron",
        "last_name": "Fields",
        "avatar": "https://reqres.in/img/faces/10-image.jpg"
      },
      {
        "id": 11,
        "email": "george.edwards@reqres.in",
        "first_name": "George",
        "last_name": "Edwards",
        "avatar": "https://reqres.in/img/faces/11-image.jpg"
      },
      {
        "id": 12,
        "email": "rachel.howell@reqres.in",
        "first_name": "Rachel",
        "last_name": "Howell",
        "avatar": "https://reqres.in/img/faces/12-image.jpg"
      }
    ],
    "support": {
      "url": "https://reqres.in/#support-heading",
      "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userListModel.data?.length ?? 0,
      itemBuilder: (context, index) {
        var user = userListModel.data![index];
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
            ),
          ),
        );
      },
    );
  }
}
