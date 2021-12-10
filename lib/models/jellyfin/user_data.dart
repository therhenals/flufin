import 'dart:convert';

import 'package:flufin/utils.dart';

class UserData {
  UserData({
    this.rating,
    this.playedPercentage,
    this.unplayedItemCount,
    required this.playbackPositionTicks,
    required this.playCount,
    required this.isFavorite,
    this.likes,
    this.lastPlayedDate,
    required this.played,
    this.key,
    this.itemId,
  });

  double? rating;
  double? playedPercentage;
  int? unplayedItemCount;
  int playbackPositionTicks;
  int playCount;
  bool isFavorite;
  bool? likes;
  DateTime? lastPlayedDate;
  bool played;
  String? key;
  String? itemId;

  factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        rating: json["Rating"],
        playedPercentage: json["PlayedPercentage"] != null
            ? Utils.checkDouble(json["PlayedPercentage"])
            : null,
        unplayedItemCount: json["UnplayedItemCount"],
        playbackPositionTicks: json["PlaybackPositionTicks"],
        playCount: json["PlayCount"],
        isFavorite: json["IsFavorite"],
        likes: json["Likes"],
        lastPlayedDate: json["LastPlayedDate"] != null
            ? DateTime.parse(json["LastPlayedDate"])
            : null,
        played: json["Played"],
        key: json["Key"],
        itemId: json["ItemId"],
      );
}
