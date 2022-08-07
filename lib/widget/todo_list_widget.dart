import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_app/provider/todos.dart';
import 'package:provider_todo_app/widget/todo_widget.dart';


class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);

    // todos form the todos.dart file all the list of todos which are not completed
    final todos = provider.todos;

// if the list is empty there is no todo
    return todos.isEmpty
        ? Center(
            child: Text(
              'No todos.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            },
          );
  }
}
