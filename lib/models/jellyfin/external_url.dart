import 'dart:convert';

class ExternalUrl {
  ExternalUrl({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory ExternalUrl.fromJson(String str) =>
      ExternalUrl.fromMap(json.decode(str));

  factory ExternalUrl.fromMap(Map<String, dynamic> json) => ExternalUrl(
        name: json["Name"],
        url: json["Url"],
      );
}
