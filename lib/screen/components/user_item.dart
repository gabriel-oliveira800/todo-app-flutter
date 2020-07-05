import 'package:flutter/material.dart';
import 'package:todoApp/models/users.dart';

class UserItem extends StatelessWidget {
  final String picture;
  final UserModel model;
  final Function onTap;

  const UserItem({this.model, this.picture, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: onTap,
        title: Text(model?.name ?? ''),
        subtitle: Text(model?.email ?? ''),
        trailing: const Icon(Icons.arrow_forward),
        leading: Hero(
          tag: model.id,
          child: CircleAvatar(backgroundImage: NetworkImage(picture)),
        ),
      ),
    );
  }
}
