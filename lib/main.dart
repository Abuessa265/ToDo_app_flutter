import 'package:flutter/material.dart';

import 'TodDoPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To do App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: ToDoPage(),
    );
  }
}
