import 'package:flutter/material.dart';
import 'package:todoApp/models/users.dart';
import 'package:todoApp/repository/repository.dart';

import '../../constants.dart';
import 'body_users.dart';

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
        BodyUsers(future: repository.getUsers()),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
      ],
    );
  }
}
