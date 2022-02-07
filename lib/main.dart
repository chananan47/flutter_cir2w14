import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/contact.dart';
import 'screens/home.dart';
import 'screens/stateful.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) :super(key:key); //create constructor

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(primarySwatch: Colors.pink),
      title: "Flutter App",
      home: StatefulScreen(),
    );
  }
}