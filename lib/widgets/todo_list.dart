import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_events/bloc/todo_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: BlocConsumer<TodoBloc, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(state.todos[index].id),
                confirmDismiss: (direction) {},
                background: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 25),
                  color: Colors.grey[300],
                  child: Text("Edit"),
                ),
                secondaryBackground: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 25),
                  color: Colors.black,
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                child: Card(
                  child: ListTile(
                    title: Text(state.todos[index].title),
                    subtitle: Text(state.todos[index].createdDate),
                    contentPadding: EdgeInsets.all(5),
                    leading: Checkbox(
                      value: state.todos[index].isCompleted,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              );
            },
          );
        },
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Added"),
            ),
          );
        },
      ),
    );
  }
}
