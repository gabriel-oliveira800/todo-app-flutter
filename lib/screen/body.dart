import 'package:flutter/material.dart';
import 'package:todoApp/repository/repository.dart';

import 'components/body_albums.dart';
import 'components/body_posts.dart';
import 'components/body_todos.dart';
import 'components/body_users.dart';

class Body extends StatelessWidget {
  final Repository repository;
  final PageController controller;
  const Body({@required this.controller, this.repository});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        BodyTodos(future: repository.getTodos(), repository: repository),
        BodyPosts(future: repository.getPosts(), repository: repository),
        BodyUsers(future: repository.getUsers(), repository: repository),
        BodyAlbums(future: repository.getAlbums(), repository: repository),
      ],
    );
  }
}
