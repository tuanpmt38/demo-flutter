import 'dart:async';
import 'package:http/http.dart' as http;

class Customer {

  int id;
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





