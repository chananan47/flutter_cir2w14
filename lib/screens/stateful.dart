import 'package:flutter/material.dart';

class StatefulScreen extends StatefulWidget {
  final String userName;
  const StatefulScreen({Key? key, this.userName = "Jeff Bezzo" }) : super(key: key); //1.Create Constructor

  @override
  _StatefulScreenState createState() => _StatefulScreenState(); //2.Create State
}

class _StatefulScreenState extends State<StatefulScreen> {
  List<String> names = ["Mark Sakaberg", "Steav Job", "Elon Mask"];
  int i = 0;
  Color color = Colors.red;
  String? name;

  @override //2.1 Init State
  void initState() {
    // TODO: implement initState
    super.initState();
    print("INIT STATE");
    this.name = widget.userName;
  }

  @override //2.2 Init didChangeDependencies
  void didChangeDependencies() {
    print("DidChangeDependencies");
    super.didChangeDependencies();
  }

  @override //2.3 Init didUpdateWidget
  void didUpdateWidget(covariant StatefulScreen oldWidget) {
    if(this.widget.userName != oldWidget.userName){
      super.didUpdateWidget(oldWidget);
    }

    @override//2.4 Init deactivate
    void deactivate(){
      print("deactivate");
      super.deactivate();
    }

    @override//2.5 Init dispose
    void dispose(){
      print("dispose");
      super.dispose();
    }

  }

  @override //3.Build
  Widget build(BuildContext context) {
    print("Build Function");

    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull Widget - $name"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.color_lens),
        backgroundColor: color,
        onPressed: (){
          setState(() { //2.2 Set State
            color = Colors.pink;
          });
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Owner of CEO is: ${names[i]}"),
            ElevatedButton(
                onPressed: () {
                  if (i < names.length - 1) {
                    setState(() {
                      i++;
                      print("$i = ${names[i]}");
                    });
                  }
                },
                child: Text("Next")),
            SizedBox(height: 5),
            ElevatedButton(
                onPressed: () {
                  if (i != 0) {
                    setState(() {
                      i--;
                      print("$i = ${names[i]}");
                    });
                  }
                },
                child: Text("Go Back"))
          ],
        ),
      ),
    );
  }
}