import 'dart:convert';

class Chapter {
  Chapter({
    required this.startPositionTicks,
    this.name,
    this.imagePath,
    required this.imageDateModified,
    this.imageTag,
  });

  int startPositionTicks;
  String? name;
  String? imagePath;
  DateTime imageDateModified;
  String? imageTag;

  factory Chapter.fromJson(String str) => Chapter.fromMap(json.decode(str));

  factory Chapter.fromMap(Map<String, dynamic> json) => Chapter(
        startPositionTicks: json["StartPositionTicks"],
        name: json["Name"],
        imagePath: json["ImagePath"],
        imageDateModified: DateTime.parse(json["ImageDateModified"]),
        imageTag: json["ImageTag"],
      );
}
