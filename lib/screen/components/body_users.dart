import 'package:flutter/material.dart';
import 'package:todoApp/models/users.dart';

import '../../constants.dart';
import '../details_user_screen.dart';
import 'user_item.dart';

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

            String picture = index % 2 == 0 ? urlModel : urlModelOne;

            return Card(
              child: UserItem(
                model: model,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsUser(
                        model: model,
                        picture: picture,
                      ),
                    ),
                  );
                },
                picture: picture,
              ),
            );
          },
        );
      },
    );
  }
}
