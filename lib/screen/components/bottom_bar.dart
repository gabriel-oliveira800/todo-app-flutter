import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final int page;
  final void Function(int) jumToPage;
  const BottomBarItem({this.page = 0, this.jumToPage});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: page,
      onTap: jumToPage,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('Users'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          title: Text('Posts'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo_album),
          title: Text('Albums'),
        ),
      ],
    );
  }
}
