import 'dart:convert';

class MediaStream {
  MediaStream({
    this.codec,
    this.codecTag,
    this.language,
    this.colorRange,
    this.colorSpace,
    this.colorTransfer,
    this.colorPrimaries,
    this.comment,
    this.timeBase,
    this.codecTimeBase,
    this.title,
    this.videoRange,
    this.localizedUndefined,
    this.localizedDefault,
    this.localizedForced,
    this.displayTitle,
    this.nalLengthSize,
    required this.isInterlaced,
    this.isAvc,
    this.channelLayout,
    this.bitRate,
    this.bitDepth,
    this.refFrames,
    this.packetLength,
    this.channels,
    this.sampleRate,
    required this.isDefault,
    required this.isForced,
    this.height,
    this.width,
    this.averageFrameRate,
    this.realFrameRate,
    this.profile,
    required this.type,
    this.aspectRatio,
    required this.index,
    this.score,
    required this.isExternal,
    this.deliveryMethod,
    this.deliveryUrl,
    this.isExternalUrl,
    required this.isTextSubtitleStream,
    required this.supportsExternalStream,
    this.path,
    this.pixelFormat,
    this.level,
    this.isAnamorphic,
  });

  String? codec;
  String? codecTag;
  String? language;
  String? colorRange;
  String? colorSpace;
  String? colorTransfer;
  String? colorPrimaries;
  String? comment;
  String? timeBase;
  String? codecTimeBase;
  String? title;
  String? videoRange;
  String? localizedUndefined;
  String? localizedDefault;
  String? localizedForced;
  String? displayTitle;
  String? nalLengthSize;
  bool isInterlaced;
  bool? isAvc;
  String? channelLayout;
  int? bitRate;
  int? bitDepth;
  int? refFrames;
  int? packetLength;
  int? channels;
  int? sampleRate;
  bool isDefault;
  bool isForced;
  int? height;
  int? width;
  double? averageFrameRate;
  double? realFrameRate;
  String? profile;
  String type;
  String? aspectRatio;
  int index;
  int? score;
  bool isExternal;
  String? deliveryMethod;
  String? deliveryUrl;
  bool? isExternalUrl;
  bool isTextSubtitleStream;
  bool supportsExternalStream;
  String? path;
  String? pixelFormat;
  double? level;
  bool? isAnamorphic;

  factory MediaStream.fromJson(String str) =>
      MediaStream.fromMap(json.decode(str));

  factory MediaStream.fromMap(Map<String, dynamic> json) => MediaStream(
        codec: json["Codec"],
        codecTag: json["CodecTag"],
        language: json["Language"],
        colorRange: json["ColorRange"],
        colorSpace: json["ColorSpace"],
        colorTransfer: json["ColorTransfer"],
        colorPrimaries: json["ColorPrimaries"],
        comment: json["Comment"],
        timeBase: json["TimeBase"],
        codecTimeBase: json["CodecTimeBase"],
        title: json["Title"],
        videoRange: json["VideoRange"],
        localizedUndefined: json["localizedUndefined"],
        localizedDefault: json["localizedDefault"],
        localizedForced: json["localizedForced"],
        displayTitle: json["DisplayTitle"],
        nalLengthSize: json["NalLengthSize"],
        isInterlaced: json["IsInterlaced"],
        isAvc: json["IsAVC"],
        channelLayout: json["ChannelLayout"],
        bitRate: json["BitRate"],
        bitDepth: json["BitDepth"],
        refFrames: json["RefFrames"],
        packetLength: json["PacketLength"],
        channels: json["Channels"],
        sampleRate: json["SampleRate"],
        isDefault: json["IsDefault"],
        isForced: json["IsForced"],
        height: json["Height"],
        width: json["Width"],
        averageFrameRate: json["AverageFrameRate"] != null
            ? _checkDouble(json["AverageFrameRate"])
            : null,
        realFrameRate: json["RealFrameRate"] != null
            ? _checkDouble(json["RealFrameRate"])
            : null,
        profile: json["Profile"],
        type: json["Type"],
        aspectRatio: json["AspectRatio"],
        index: json["Index"],
        score: json["Score"],
        isExternal: json["IsExternal"],
        deliveryMethod: json["DeliveryMethod"],
        deliveryUrl: json["DeliveryUrl"],
        isExternalUrl: json["IsExternalUrl"],
        isTextSubtitleStream: json["IsTextSubtitleStream"],
        supportsExternalStream: json["SupportsExternalStream"],
        path: json["Path"],
        pixelFormat: json["PixelFormat"],
        level: json["Level"] != null ? _checkDouble(json["Level"]) : null,
        isAnamorphic: json["IsAnamorphic"],
      );
}

double _checkDouble(dynamic value) {
  if (value is int) {
    return value.toDouble();
  } else if (value is String) {
    return double.parse(value);
  } else {
    return value;
  }
}
