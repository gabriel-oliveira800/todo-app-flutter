import 'package:flutter/material.dart';
import 'package:todoApp/models/todos.dart';
import 'package:todoApp/models/users.dart';
import 'package:todoApp/repository/repository.dart';

import '../../constants.dart';
import '../details_user_screen.dart';
import 'todo_item.dart';
import 'user_item.dart';

class BodyUsers extends StatelessWidget {
  final Repository repository;
  final Future<List<UserModel>> future;

  const BodyUsers({@required this.future, @required this.repository});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
      future: future,
      builder: (_, snapshot) {
        if (snapshot.hasError) return Center(child: Text('Erro Desconhecido'));

        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return ListView.builder(
          addSemanticIndexes: false,
          addRepaintBoundaries: false,
          itemCount: snapshot.data.length,
          itemBuilder: (_, index) {
            UserModel userModel = snapshot.data[index];

            String picture = index % 2 == 0 ? urlModel : urlModelOne;

            return Card(
              child: Column(
                children: <Widget>[
                  UserItem(
                    model: userModel,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsUser(
                            model: userModel,
                            picture: picture,
                          ),
                        ),
                      );
                    },
                    picture: picture,
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: FutureBuilder<List<TodoModel>>(
                      future: repository.getUsersTodos(userModel.id),
                      builder: (_, snapshot) {
                        if (!snapshot.hasData)
                          return Center(child: CircularProgressIndicator());

                        final List<TodoModel> todos = snapshot.data;

                        return AnimatedContainer(
                          height: todos.isNotEmpty ? 240 : 60,
                          duration: Duration(milliseconds: 300),
                          child: TodoItem(todos: todos),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: SizedBox(
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.deepPurple,
                        child: Text(
                          'Add Todo',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
