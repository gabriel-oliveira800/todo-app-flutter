import 'package:flutter/material.dart';
import 'package:todoApp/models/todos.dart';
import 'package:todoApp/repository/repository.dart';

import 'todo_item.dart';

class BodyTodos extends StatefulWidget {
  final Repository repository;
  final Future<List<TodoModel>> future;

  const BodyTodos({@required this.future, @required this.repository});

  @override
  _BodyTodosState createState() => _BodyTodosState();
}

class _BodyTodosState extends State<BodyTodos> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TodoModel>>(
      future: widget.future,
      builder: (_, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        final List<TodoModel> todos = snapshot.data;

        return TodoItem(
          todos: todos,
          onChanged: (index, value) {
            setState(() {
              todos[index].completed = value;
            });
          },
        );
      },
    );
  }
}
