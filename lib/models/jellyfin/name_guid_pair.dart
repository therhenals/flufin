import 'dart:convert';

class NameGuidPair {
  NameGuidPair({
    this.name,
    required this.id,
  });

  String? name;
  String id;

  factory NameGuidPair.fromJson(String str) =>
      NameGuidPair.fromMap(json.decode(str));

  factory NameGuidPair.fromMap(Map<String, dynamic> json) => NameGuidPair(
        name: json["Name"],
        id: json["Id"],
      );
}
