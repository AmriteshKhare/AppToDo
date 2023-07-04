import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apptodo/api/firebase_api.dart';
import 'package:apptodo/model/todo.dart';
import 'package:apptodo/provider/todos.dart';
import 'package:apptodo/widget/add_todo_dialog_widget.dart';
import 'package:apptodo/widget/completed_list_widget.dart';
import 'package:apptodo/widget/todo_list_widget.dart';

import '../main.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          MyApp.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF9E7BFF),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF9E7BFF),
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: "Task's",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Finished',
          ),
        ],
      ),
      body: StreamBuilder<List<Todo>>(
        stream: FirebaseApi.readTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return buildText('Something Went Wrong. Try again later.');
              } else {
                final todos = snapshot.data;

                final provider = Provider.of<TodosProvider>(context);
                provider.setTodos(todos);

                return tabs[selectedIndex];
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Color(0xFFFFE5A0),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.indigo),
      ),
    );











// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:apptodo/api/firebase_api.dart';
// import 'package:apptodo/model/todo.dart';
// import 'package:apptodo/provider/todos.dart';
// import 'package:apptodo/widget/add_todo_dialog_widget.dart';
// import 'package:apptodo/widget/completed_list_widget.dart';
// import 'package:apptodo/widget/todo_list_widget.dart';

// import '../main.dart';

// class HomePage1 extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage1> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final tabs = [
//       TodoListWidget(),
//       CompletedListWidget(),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           MyApp.title,
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.white.withOpacity(0.7),
//         selectedItemColor: Colors.white,
//         currentIndex: selectedIndex,
//         onTap: (index) => setState(() {
//           selectedIndex = index;
//         }),
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.fact_check_outlined),
//             label: 'Todos',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.done, size: 28),
//             label: 'Completed',
//           ),
//         ],
//       ),
//       body: StreamBuilder<List<Todo>>(
//         stream: FirebaseApi.readTodos(),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting:
//               return Center(child: CircularProgressIndicator());
//             default:
//               if (snapshot.hasError) {
//                 return buildText('Something Went Wrong. Try again later.');
//               } else {
//                 final todos = snapshot.data;

//                 final provider = Provider.of<TodosProvider>(context);
//                 provider.setTodos(todos);

//                 return tabs[selectedIndex];
//               }
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         backgroundColor: Colors.pinkAccent,
//         onPressed: () => showDialog(
//           context: context,
//           builder: (context) => AddTodoDialogWidget(),
//           barrierDismissible: false,
//         ),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// Widget buildText(String text) => Center(
//       child: Text(
//         text,
//         style: TextStyle(fontSize: 24, color: Colors.white),
//       ),
//     );







//attemp1

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:apptodo/api/firebase_api.dart';
// import 'package:apptodo/model/todo.dart';
// import 'package:apptodo/provider/todos.dart';
// import 'package:apptodo/widget/add_todo_dialog_widget.dart';
// import 'package:apptodo/widget/completed_list_widget.dart';
// import 'package:apptodo/widget/todo_list_widget.dart';

// import '../main.dart';

// class HomePage1 extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage1> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final tabs = [
//       TodoListWidget(),
//       CompletedListWidget(),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(MyApp.title),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.white.withOpacity(0.7),
//         selectedItemColor: Colors.white,
//         currentIndex: selectedIndex,
//         onTap: (index) => setState(() {
//           selectedIndex = index;
//         }),
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.fact_check_outlined),
//             label: 'Todos',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.done, size: 28),
//             label: 'Completed',
//           ),
//         ],
//       ),
//       body: StreamBuilder<List<Todo>>(
//         stream: FirebaseApi.readTodos(),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting:
//               return Center(child: CircularProgressIndicator());
//             default:
//               if (snapshot.hasError) {
//                 return buildText('Something Went Wrong Try later');
//               } else {
//                 final todos = snapshot.data;

//                 final provider = Provider.of<TodosProvider>(context);
//                 provider.setTodos(todos);

//                 return tabs[selectedIndex];
//               }
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         backgroundColor: Colors.black,
//         onPressed: () => showDialog(
//           context: context,
//           builder: (context) => AddTodoDialogWidget(),
//           barrierDismissible: false,
//         ),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// Widget buildText(String text) => Center(
//       child: Text(
//         text,
//         style: TextStyle(fontSize: 24, color: Colors.white),
//       ),
//     );
