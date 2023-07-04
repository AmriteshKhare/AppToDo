import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apptodo/provider/todos.dart';
import 'package:apptodo/page/Landingpage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Task';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors
              .black, // Updated primary color to black for a minimalist look
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Roboto', // Updated font family for simplicity
        ),
        home: HomePage(), // Updated to use LandingPage instead of HomePage
      ),
    );
  }
}
