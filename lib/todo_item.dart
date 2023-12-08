
import 'package:flutter/material.dart';
import 'package:todo_app/my_todo.dart';

class TodoItem extends StatelessWidget {

  final MyTodo todo;
  final Function(bool) onChanged;

  const TodoItem({super.key,
    required this.todo,
    required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(todo.name),
        subtitle: Text('Priority: ${todo.priority.name}'),
        value: todo.completed,
        onChanged: (value){
          onChanged(value!);
        }
    );
  }
}
