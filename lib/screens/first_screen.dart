import 'package:flutter/material.dart';
import 'package:flutter_basic/screens/stateful.dart';
import 'contact.dart';
import 'home.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget{
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //const FirstScreen({Key? key}):super(key:key); //1.Create constructor
  int  _index = 0;

  List pages = [HomeScreen(),SecondScreen(),Contact(),StatefulScreen(),];

  @override //2.build
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Android"),
              accountEmail: Text("android@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.android),
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              title: Text("First Screen"),
              leading: Icon(Icons.send),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Second Screen"),
              leading: Icon(Icons.account_balance),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
              },
            ),
            ListTile(
              title: Text("Contact Us"),
              leading: Icon(Icons.call),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Contact()));
              },
            ),
          ],
        ),
      ),
      // appBar: AppBar(
      //   title: Text("First Screen"),
      //   centerTitle: true,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          //BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: "Second"),
          BottomNavigationBarItem(icon: Icon(Icons.contacts),label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Users"),
        ],
        onTap: (index){
          print(index);
          setState(() {
            _index = index;
          });
        },
      ),
      body: pages[_index],
    );
  }
}