import 'package:flutter/material.dart';
import 'package:todoApp/models/todos.dart';

class TodoItem extends StatelessWidget {
  final List<TodoModel> todos;
  final Function(int, bool) onChanged;

  const TodoItem({@required this.todos, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      addSemanticIndexes: false,
      addRepaintBoundaries: false,
      itemCount: todos.length,
      itemBuilder: (_, index) {
        final TodoModel model = todos[index];

        return ListTile(
          title: Text(model.title),
          trailing: getIcon(model.completed),
          leading: Checkbox(
            value: model.completed,
            onChanged: (value) {
              if (onChanged != null) {
                onChanged(index, value);
              }
            },
          ),
        );
      },
    );
  }

  Widget getIcon(bool completed) {
    if (completed) {
      return Icon(Icons.check_circle, color: Colors.green);
    }

    return Icon(Icons.clear, color: Colors.red);
  }
}
