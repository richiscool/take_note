import 'dart:convert';

class User {
  String? id;
  String name;
  String email;
  DateTime creationDate;
  String? password;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.creationDate, required String password,
  });



  User.fromJson(Map<String, dynamic> json):
    id = json['id'],
    name = json['name'],
    email = json['email'],
    creationDate = DateTime.parse(json['creationDate']),
    password = json['password'] ?? "";

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'creationDate': creationDate.toIso8601String(),
    'password': password,
  };
}