import 'dart:convert';

class ImageTags {
  ImageTags({
    this.primary,
  });

  String? primary;

  factory ImageTags.fromJson(String str) => ImageTags.fromMap(json.decode(str));

  factory ImageTags.fromMap(Map<String, dynamic> json) => ImageTags(
        primary: json["Primary"],
      );
}
