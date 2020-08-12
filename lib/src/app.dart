import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DEMO STREAM"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Center(
          child: Text(
            "0",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          click();
        },
        child: Icon(Icons.add),
      ),
    );
  }
  void click(){

  }
}
