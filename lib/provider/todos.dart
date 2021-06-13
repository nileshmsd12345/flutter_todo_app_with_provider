import 'package:flutter/cupertino.dart';
import 'package:todo_app_provider/model/todo.dart';

class TodosProvider extends ChangeNotifier{
  List<Todo> _todos = [
    Todo(
        title: 'Buy Food 🍕',
        createdTime: DateTime.now(),
        description: ''' 
      - Eggs
      - Milk
      - Bread
      - Water
      '''
    ),
    Todo(
        title: 'Plan family trip to Norway ✈️',
        createdTime: DateTime.now(),
        description: ''' 
      - Rent some hotels
      - Rent a car
      - Pack suitcase
      
      '''
    ),
    Todo(
      title: 'Walk the Dog 🐕',
      createdTime: DateTime.now(),
    ),
    Todo(
      title: 'plan Jacobs birthday party 🥳 🎉',
      createdTime: DateTime.now(),
    ),


  ];

  List<Todo> get todos=> _todos.where((todo) =>todo.isDone== false).toList();
  List<Todo> get todosCompleted=> _todos.where((todo) =>todo.isDone== true).toList();

  void addTodo(Todo todo){
    _todos.add(todo);
    notifyListeners();
  }
  void removeTodo(Todo todo){
    _todos.remove(todo);
    notifyListeners();
  }
  bool toggleTodoStatus(Todo todo){
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }
  void updateTodo(Todo todo, String title, String description){
    todo.title = title;
    todo.description= description;
    notifyListeners();
  }
}