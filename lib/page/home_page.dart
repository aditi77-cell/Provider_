import 'package:flutter/material.dart';
import 'package:provider_todo_app/main.dart';
import 'package:provider_todo_app/widget/add_todo_dialog_widget.dart';
import 'package:provider_todo_app/widget/completed_list_widget.dart';
import 'package:provider_todo_app/widget/todo_list_widget.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
         //background color of bottomNavigationbar
        backgroundColor: Theme.of(context).primaryColor,

        //greyshad (white) color for the  Text in Bottomnavigation bar 
        unselectedItemColor: Colors.white.withOpacity(0.7),

        //white color for the selected option in BottomNviagation bar
        selectedItemColor: Colors.white,            

        // current index selected (item selected )
        
        currentIndex: selectedIndex,
        //TODO use only provider
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),

        // Two items in the BottomNavigation bar 
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Completed',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.blue,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDialogWidget(),

          //dialog not dismiss when we click on the screen 
          barrierDismissible: false,  
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
