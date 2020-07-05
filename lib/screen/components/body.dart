import 'package:flutter/material.dart';
import 'package:todoApp/models/users.dart';
import 'package:todoApp/repository/repository.dart';

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
        FutureBuilder<List<UserModel>>(
          future: repository.getUsers(),
          builder: (_, snapshot) {
            if (snapshot.hasError)
              return Center(child: Text('Erro Desconhecido'));

            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                UserModel model = snapshot.data[index];

                return ListTile(
                  title: Text(model.name ?? ''),
                  subtitle: Text(model.email ?? ''),
                  trailing: Icon(Icons.arrow_forward),
                  leading: CircleAvatar(child: Icon(Icons.person)),
                );
              },
            );
          },
        ),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
      ],
    );
  }
}
