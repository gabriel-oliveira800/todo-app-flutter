import 'package:flutter/material.dart';
import 'package:todoApp/models/users.dart';

import '../../constants.dart';

class BodyUsers extends StatelessWidget {
  const BodyUsers({@required this.future});
  final Future<List<UserModel>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
      future: future,
      builder: (_, snapshot) {
        if (snapshot.hasError) return Center(child: Text('Erro Desconhecido'));

        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (_, index) {
            UserModel model = snapshot.data[index];

            return Card(
              child: ListTile(
                title: Text(model.name ?? ''),
                subtitle: Text(model.email ?? ''),
                trailing: Icon(Icons.arrow_forward),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(index % 2 == 0 ? urlModel : urlModelOne),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
