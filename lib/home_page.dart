import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_events/bloc/todo_bloc.dart';
import 'package:flutter_bloc_events/models/todo.dart';
import 'package:flutter_bloc_events/todo_list_page.dart';
import 'package:flutter_bloc_events/widgets/todo_list.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(35),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Todo List",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
              TodoList(),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "save",
            onPressed: () {
              var uuid = Uuid();
              var todo = Todo(
                id: uuid.toString(),
                title: _controller.text,
                createdDate: DateTime.now().toString(),
              );
              BlocProvider.of<TodoBloc>(context).add(
                TodoEvent.add(todo),
              );
              _controller.clear();
            },
            child: Icon(
              Icons.save,
              size: 35,
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "todo",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoListPage(),
                ),
              );
            },
            child: Icon(
              Icons.navigate_next,
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}
