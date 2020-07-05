import 'package:flutter/material.dart';
import 'package:todoApp/models/users.dart';

class UserItem extends StatelessWidget {
  final String picture;
  final UserModel model;

  const UserItem({this.model, this.picture});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(model?.name ?? ''),
        subtitle: Text(model?.email ?? ''),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(picture),
        ),
      ),
    );
  }
}
