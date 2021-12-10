import 'dart:convert';

import 'package:flufin/models/models.dart';

class PlaybackInfo {
  PlaybackInfo({
    this.mediaSources,
    this.playSessionId,
    this.errorCode,
  });

  List<MediaSource>? mediaSources;
  String? playSessionId;
  String? errorCode;

  factory PlaybackInfo.fromJson(String str) =>
      PlaybackInfo.fromMap(json.decode(str));

  factory PlaybackInfo.fromMap(Map<String, dynamic> json) => PlaybackInfo(
        mediaSources: List<MediaSource>.from(
            json["MediaSources"].map((x) => MediaSource.fromMap(x))),
        playSessionId: json["PlaySessionId"],
        errorCode: json["ErrorCode"],
      );
}
