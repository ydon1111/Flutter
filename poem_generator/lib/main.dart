import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poem Generator Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const PoemPage(title: 'Poem Home Page'),
    );
  }
}






