import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_events/models/todo.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(todos: const []));
  @override
  void onTransition(Transition<TodoEvent, TodoState> transition) {
    print(transition.event);
    super.onTransition(transition);
  }

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        var list = state.todos.toList();
        if (event.todo != null) {
          list.add(event.todo);
        }
        yield state.copyWith(todos: list);
        break;
      case EventType.delete:
        var list = state.todos.toList();
        list.remove(event.todo);
        yield state.copyWith(todos: list);
        break;
      default:
        throw Exception('Event $event not found');
    }
  }
}
