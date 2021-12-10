import 'dart:convert';

class MediaUrl {
  MediaUrl({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory MediaUrl.fromJson(String str) => MediaUrl.fromMap(json.decode(str));

  factory MediaUrl.fromMap(Map<String, dynamic> json) => MediaUrl(
        name: json["Name"],
        url: json["Url"],
      );
}
