import 'dart:convert';

class MediaAttachment {
  MediaAttachment({
    this.codec,
    this.codecTag,
    this.comment,
    required this.index,
    this.fileName,
    this.mimeType,
    this.deliveryUrl,
  });

  String? codec;
  String? codecTag;
  String? comment;
  int index;
  String? fileName;
  String? mimeType;
  String? deliveryUrl;

  factory MediaAttachment.fromJson(String str) =>
      MediaAttachment.fromMap(json.decode(str));

  factory MediaAttachment.fromMap(Map<String, dynamic> json) => MediaAttachment(
        codec: json["Codec"],
        codecTag: json["CodecTag"],
        comment: json["Comment"],
        index: json["Index"],
        fileName: json["FileName"],
        mimeType: json["MimeType"],
        deliveryUrl: json["DeliveryUrl"],
      );
}
