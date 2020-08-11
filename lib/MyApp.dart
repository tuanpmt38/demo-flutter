import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Customer> fetchAlbum() async {
  final response = await http.get('http://192.168.10.73:8083/api/v1/customers/1');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Customer.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Customer {
  final int id;
  String name;
  String address;
  int age;
  DateTime birthday;

  Customer({
    this.id,
    this.name,
    this.address,
    this.age,
    this.birthday
  });

  factory Customer.fromJson(Map <String, dynamic> json){
    return Customer(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        address: json["address"],
        birthday: json["brithday"]
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Customer> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        )
      ),
    );
  }
}
