import 'package:flutter/material.dart';
import 'package:learning/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:learning/providers/todo_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => TodoProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Poppins',
                  color: Colors.black),
              headline2: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: Colors.black87),
              headline3: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins'),
              bodyText1: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins'))),
      initialRoute: '/',
      routes: {'/': (context) => Home()},
    );
  }
}
