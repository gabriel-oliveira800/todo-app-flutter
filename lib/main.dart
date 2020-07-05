import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todoApp/repository/repository.dart';

import 'client/client_dio.dart';
import 'screen/home_screen.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(repository: Repository(CustomDio(Dio()))),
      debugShowCheckedModeBanner: false,
    );
  }
}
