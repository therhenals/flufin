import 'dart:convert';

import 'package:flufin/models/models.dart';

class MediaSource {
  MediaSource({
    required this.protocol,
    this.id,
    this.path,
    this.encoderPath,
    this.encoderProtocol,
    required this.type,
    this.container,
    this.size,
    this.name,
    required this.isRemote,
    this.eTag,
    this.runTimeTicks,
    required this.readAtNativeFramerate,
    required this.ignoreDts,
    required this.ignoreIndex,
    required this.genPtsInput,
    required this.supportsTranscoding,
    required this.supportsDirectStream,
    required this.supportsDirectPlay,
    required this.isInfiniteStream,
    required this.requiresOpening,
    this.openToken,
    required this.requiresClosing,
    this.liveStreamId,
    this.bufferMs,
    required this.requiresLooping,
    required this.supportsProbing,
    this.videoType,
    this.isoType,
    this.video3DFormat,
    this.mediaStreams,
    this.mediaAttachments,
    this.formats,
    this.bitrate,
    this.timestamp,
    this.transcodingUrl,
    this.transcodingSubProtocol,
    this.transcodingContainer,
    this.analyzeDurationMs,
    this.defaultAudioStreamIndex,
    this.defaultSubtitleStreamIndex,
  });

  String protocol;
  String? id;
  String? path;
  String? encoderPath;
  String? encoderProtocol;
  String type;
  String? container;
  int? size;
  String? name;
  bool isRemote;
  String? eTag;
  int? runTimeTicks;
  bool readAtNativeFramerate;
  bool ignoreDts;
  bool ignoreIndex;
  bool genPtsInput;
  bool supportsTranscoding;
  bool supportsDirectStream;
  bool supportsDirectPlay;
  bool isInfiniteStream;
  bool requiresOpening;
  String? openToken;
  bool requiresClosing;
  String? liveStreamId;
  int? bufferMs;
  bool requiresLooping;
  bool supportsProbing;
  String? videoType;
  String? isoType;
  String? video3DFormat;
  List<MediaStream>? mediaStreams;
  List<MediaAttachment>? mediaAttachments;
  List<String>? formats;
  int? bitrate;
  String? timestamp;
  String? transcodingUrl;
  String? transcodingSubProtocol;
  String? transcodingContainer;
  int? analyzeDurationMs;
  int? defaultAudioStreamIndex;
  int? defaultSubtitleStreamIndex;

  factory MediaSource.fromJson(String str) =>
      MediaSource.fromMap(json.decode(str));

  factory MediaSource.fromMap(Map<String, dynamic> json) => MediaSource(
        protocol: json["Protocol"],
        id: json["Id"],
        path: json["Path"],
        encoderPath: json["EncoderPath"],
        encoderProtocol: json["EncoderProtocol"],
        type: json["Type"],
        container: json["Container"],
        size: json["Size"],
        name: json["Name"],
        isRemote: json["IsRemote"],
        eTag: json["ETag"],
        runTimeTicks: json["RunTimeTicks"],
        readAtNativeFramerate: json["ReadAtNativeFramerate"],
        ignoreDts: json["IgnoreDts"],
        ignoreIndex: json["IgnoreIndex"],
        genPtsInput: json["GenPtsInput"],
        supportsTranscoding: json["SupportsTranscoding"],
        supportsDirectStream: json["SupportsDirectStream"],
        supportsDirectPlay: json["SupportsDirectPlay"],
        isInfiniteStream: json["IsInfiniteStream"],
        requiresOpening: json["RequiresOpening"],
        openToken: json["OpenToken"],
        requiresClosing: json["RequiresClosing"],
        liveStreamId: json["LiveStreamId"],
        bufferMs: json["BufferMs"],
        requiresLooping: json["RequiresLooping"],
        supportsProbing: json["SupportsProbing"],
        videoType: json["VideoType"],
        isoType: json["IsoType"],
        video3DFormat: json["Video3DFormat"],
        mediaStreams: List<MediaStream>.from(
            json["MediaStreams"].map((x) => MediaStream.fromMap(x))),
        mediaAttachments: List<MediaAttachment>.from(
            json["MediaAttachments"].map((x) => MediaAttachment.fromMap(x))),
        formats: List<String>.from(json["Formats"].map((x) => x)),
        bitrate: json["Bitrate"],
        timestamp: json["Timestamp"],
        transcodingUrl: json["TranscodingUrl"],
        transcodingSubProtocol: json["TranscodingSubProtocol"],
        transcodingContainer: json["TranscodingContainer"],
        analyzeDurationMs: json["AnalyzeDurationMs"],
        defaultAudioStreamIndex: json["DefaultAudioStreamIndex"],
        defaultSubtitleStreamIndex: json["DefaultSubtitleStreamIndex"],
      );
}
