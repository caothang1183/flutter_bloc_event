part of 'todo_bloc.dart';

enum EventType { add, delete }

class TodoEvent {
  Todo todo;
  String id;
  EventType eventType;

  TodoEvent.add(Todo todo) {
    this.eventType = EventType.add;
    this.todo = todo;
  }

  TodoEvent.delete(Todo todo) {
    this.eventType = EventType.delete;
    this.todo = todo;
  }
}
