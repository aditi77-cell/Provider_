import 'package:flutter/cupertino.dart';
import 'package:provider_todo_app/model/todo.dart';


class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
     
      title: 'Buy Grocery ',
      description: '''Eggs
                      ''',
    ),
    Todo(
    
      title: 'Shoping ',
      description: '''dresses
suits
                        ''',
    ),
    Todo(
      
      title: 'Walk the Dog ',
    ),
   
  ];


  //make todos public
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
 //update the Ui
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

  
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
