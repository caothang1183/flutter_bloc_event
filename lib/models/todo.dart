import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;
  final String createdDate;

  Todo({
    this.id,
    @required this.title,
    this.isCompleted = false,
    this.createdDate,
  });

  @override
  String toString() =>
      'Todo(title: $title, isCompleted: $isCompleted, createdDate: $createdDate)';

  Todo copyWith({
    String title,
    bool isCompleted,
    String createdDate,
  }) {
    return Todo(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  List<Object> get props => [
        this.id,
        this.title,
        this.isCompleted,
        this.createdDate,
      ];
}
