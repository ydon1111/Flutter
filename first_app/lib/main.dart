import 'package:flutter/material.dart';
import '/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {

  // init hive
  await Hive.initFlutter();

  // box 불러오기  * 이거 안하면 오류
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}