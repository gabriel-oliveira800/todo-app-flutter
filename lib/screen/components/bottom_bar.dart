import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final int page;
  final void Function(int) jumToPage;
  const BottomBarItem({this.page = 0, this.jumToPage});

  @override
  Widget build(BuildContext context) {
    final Color unselectedColor = Colors.grey;
    final Color backgroundColor = Colors.white;
    final Color selectedColor = Colors.deepPurple;

    return BottomNavigationBar(
      currentIndex: page,
      onTap: jumToPage,
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      selectedItemColor: selectedColor,
      unselectedItemColor: unselectedColor,
      selectedLabelStyle: TextStyle(color: selectedColor),
      unselectedLabelStyle: TextStyle(color: unselectedColor),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text('Users'),
          icon: Icon(Icons.person_outline),
          backgroundColor: backgroundColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.toc),
          title: Text('Todos'),
          backgroundColor: backgroundColor,
        ),
        BottomNavigationBarItem(
          title: Text('Posts'),
          icon: Icon(Icons.message),
          backgroundColor: backgroundColor,
        ),
        BottomNavigationBarItem(
          title: Text('Albums'),
          icon: Icon(Icons.photo_album),
          backgroundColor: backgroundColor,
        ),
      ],
    );
  }
}
