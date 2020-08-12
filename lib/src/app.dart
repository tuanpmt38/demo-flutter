import 'package:demo_hello_word/src/blocs/stream_bloc.dart';
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
  InProcessData inProcessData = new InProcessData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DEMO STREAM"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Center(
          child: StreamBuilder(
            stream: inProcessData.dataStream,
              builder: (context, snapshot) => Text(
                  snapshot.hasData? snapshot.data.toString() : "0",
                  style: TextStyle(fontSize: 20, color: Colors.black))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          inProcessData.click();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
