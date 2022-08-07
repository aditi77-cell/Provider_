import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_app/model/todo.dart';
import 'package:provider_todo_app/provider/todos.dart';
import 'package:provider_todo_app/widget/todo_form_widget.dart';


class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  //Two fields which we requried in the dialog box
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          // form key is used for validations 
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Todo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              Consumer<TodosProvider>(builder:((context, value, child) => 
              TodoFormWidget(
                onChangedTitle: (title) => this.title = title,
                 onChangedDescription:   (description) =>
                     this.description = description,
              
                onSavedTodo: addTodo,
              )),
          )],
          ),
        ),
      );


// method 
  void addTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        title: title,
        description: description,
       
      );

      // add list of list

      final provider = Provider.of<TodosProvider>(context, listen: false);
      //listen is set false,
      //it won't cause this widget to rebuild when notifyListener is called
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }
}
