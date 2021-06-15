import 'package:flutter/material.dart';
import 'package:flutter_bloc_events/widgets/todo_list.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Container(
        child: TodoList(),
      ),
    );
  }
}
