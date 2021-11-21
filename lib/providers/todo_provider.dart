import 'package:flutter/material.dart';
import 'package:learning/models/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> todos = [];

  void addTodo(title, desc) {
    int id = todos.length + 1;
    Todo t = Todo(id, title, desc, DateTime.now());
    todos.add(t);
    notifyListeners();
  }

  void markTodoAsCompleted(id) {
    Todo t = todos.where((todo) => todo.id == id).toList().first;
    t.markAsCompleted();
    notifyListeners();
  }

  void deleteTodo(id) {
    todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
