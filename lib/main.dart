import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          toolbarHeight: 100,
          elevation: 70,
          leading: Icon(Icons.home),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is mod 5 Assignment",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              RichText(
                  text: TextSpan(
                      text: 'My ',
                      style: TextStyle(fontSize: 25, color: Colors.pink),
                      children: [
                    TextSpan(
                        text: 'phone ',
                        style: TextStyle(fontSize: 15, color: Colors.blue)),
                    TextSpan(
                        text: 'name ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.purpleAccent,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'Your phone name',
                      style: TextStyle(
                          fontSize: 25, color: Colors.deepOrangeAccent),
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
