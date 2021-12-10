class Media {
  Media({
    required this.type,
    required this.name,
    required this.url,
    required this.aspectRatio,
    required this.header,
    required this.audioDefault,
    required this.subtitleDefault,
    this.position = 0,
    this.rePlay = true,
    this.subtitles,
    this.audios,
  });

  String type;
  String name;
  String url;
  double aspectRatio;
  String header;
  int position;
  bool rePlay;
  int audioDefault;
  int subtitleDefault;
  List<Subtitle>? subtitles;
  List<Audio>? audios;
}

class Subtitle {
  Subtitle({
    required this.name,
    required this.url,
    required this.index,
  });

  String name;
  String url;
  int index;
}

class Audio {
  Audio({
    required this.name,
    required this.index,
  });

  String name;
  int index;
}
