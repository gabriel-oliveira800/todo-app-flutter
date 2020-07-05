import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todoApp/client/client_dio.dart';
import 'package:todoApp/repository/repository.dart';

import 'body.dart';
import 'components/bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Repository repository = Repository(CustomDio(Dio()));
  final PageController controller = PageController(initialPage: 0);

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo Exemplo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.account_balance, size: 32),
      ),
      body: Body(
        controller: controller,
        repository: repository,
      ),
      bottomNavigationBar: BottomBarItem(
        page: currentPage,
        jumToPage: (page) {
          setState(() {
            currentPage = page;
          });
          controller.jumpToPage(page);
        },
      ),
    );
  }
}
