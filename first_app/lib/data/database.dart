import 'package:hive_flutter/hive_flutter.dart';


class ToDoDataBase{
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');


  // 앱실행시 한번만 초기화
  void createInitialData(){
    toDoList = [
      ["플루터 공부하기",false],
      ["코틀린 공부하기",false],
    ];
  }

  //데이터베이스 데이터 불러오기
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  //데이터베이스 업데이트
  void updateDataBase(){
    _myBox.put("TODOLIST", toDoList);
  }
}