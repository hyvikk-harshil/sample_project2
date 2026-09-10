import 'package:flutter/cupertino.dart';
import '../modals/modal_todo.dart';

class TodoProvider extends ChangeNotifier{
  List<ModalTodo> _todos = [];
  List<ModalTodo> get todos => _todos;
  int completeCount=0;

  void addTodo(String title){
    _todos.add(ModalTodo(title: title));
    notifyListeners();
  }

  void toggleTodo(int index){
    _todos[index].complete = ! _todos[index].complete;
    completeCount = _todos.where((todos)=>todos.complete).length;
    notifyListeners();
  }

  void removeTodo(int index){
    _todos.removeAt(index);
    notifyListeners();
  }
}