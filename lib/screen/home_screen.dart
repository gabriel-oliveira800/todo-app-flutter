import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App', style: Theme.of(context).textTheme.headline5),
      ),
      body: FutureBuilder(
        builder: (_, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListTile(title: Text('Testando'));
        },
      ),
    );
  }
}
