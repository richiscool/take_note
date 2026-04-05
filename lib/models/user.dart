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
    required this.creationDate,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json)
    : name = json["name"],
      id = json["id"] ?? "",
      email = json["email"],
      creationDate = DateTime.parse(json["creationDate"]),
      password = json["password"] ?? "";

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "email": email,
    "creationDate": creationDate.toIso8601String(),
    "password": password,
  };
}