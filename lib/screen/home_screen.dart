import 'package:flutter/material.dart';
import 'package:todoApp/models/users.dart';
import 'package:todoApp/repository/repository.dart';

class HomeScreen extends StatefulWidget {
  final Repository repository;
  const HomeScreen({Key key, @required this.repository}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Repository get repository => widget.repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App', style: Theme.of(context).textTheme.headline5),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: repository.getUsers(),
        builder: (_, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListTile(title: Text('Testando'));
        },
      ),
    );
  }
}
