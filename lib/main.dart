import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/screen/home_page.dart';
void main(){
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "To Do App",
      home: HomePage(),

    );
  }
}