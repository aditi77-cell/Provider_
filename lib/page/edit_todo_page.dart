import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_app/model/todo.dart';
import 'package:provider_todo_app/provider/todos.dart';
import 'package:provider_todo_app/widget/todo_form_widget.dart';


class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, @required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();

  String title;
  String description;

  @override
  void initState() {
    super.initState();
  
  //initial value of the title and description 
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
        appBar: AppBar(
          title: Text('Edit Todo'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.removeTodo(widget.todo);

                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child:   Consumer<TodosProvider>(builder:((context, value, child) => 
              TodoFormWidget(
                onChangedTitle: (title) => this.title = title,
                 onChangedDescription:   (description) =>
                     this.description = description,
              
              onSavedTodo: saveTodo,
            )),
          ),
        ),
  ));
  }
  void saveTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo, title, description);

      Navigator.of(context).pop();
    }
  }
}
