import 'dart:convert';

import 'package:flufin/models/models.dart';

class Items {
  Items({
    required this.items,
    required this.totalRecordCount,
    required this.startIndex,
  });

  List<Item> items;
  int totalRecordCount;
  int startIndex;

  factory Items.fromJson(String str) => Items.fromMap(json.decode(str));

  factory Items.fromMap(Map<String, dynamic> json) => Items(
        items: List<Item>.from(json["Items"].map((x) => Item.fromMap(x))),
        totalRecordCount: json["TotalRecordCount"],
        startIndex: json["StartIndex"],
      );
}
