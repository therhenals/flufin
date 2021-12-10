import 'dart:convert';

class Person {
  Person({
    this.name,
    this.id,
    this.role,
    this.type,
    this.primaryImageTag,
  });

  String? name;
  String? id;
  String? role;
  String? type;
  String? primaryImageTag;

  factory Person.fromJson(String str) => Person.fromMap(json.decode(str));

  factory Person.fromMap(Map<String, dynamic> json) => Person(
        name: json["Name"],
        id: json["Id"],
        role: json["Role"],
        type: json["Type"],
        primaryImageTag: json["PrimaryImageTag"],
      );
}
