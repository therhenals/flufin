import 'package:flufin/services/image_service.dart';
import 'package:flutter/material.dart';

import 'package:flufin/models/models.dart';
import 'package:flufin/services/services.dart';
import 'package:flufin/utils.dart';

class JellyfinService extends ChangeNotifier {
  final _api = ApiService();

  late String _address;
  late String _userId;

  // Data
  bool initial = false;
  List<Item> resume = [];
  List<Item> nextUp = [];
  List<Item> views = [];
  List<Map<String, List<Item>>> latest = [];
  List<Item> collection = [];
  List<Item> episodes = [];
  List<Item> seasons = [];

  Item? details;
  Item? episode;
  Item? season;
  PlaybackInfo? playbackInfo;
  Media? media;

  set address(String value) {
    _address = value;
  }

  set userId(String value) {
    _userId = value;
  }

  set setInitial(bool value) {
    initial = value;
    notifyListeners();
  }

  Future getInitialData() async {
    await getResumeItems();
    await getNextUpShows();
    await getViews();
    getAllLatestItems();
    initial = true;
    notifyListeners();
  }

  clearItems(String type) {
    if (type == 'Episode') {
      episode = null;
    } else if (type == 'Season') {
      season = null;
    } else if (type == 'Movie' || type == 'Series') {
      details = null;
    }
  }

  setItems(Item item) {
    if (item.type == 'Episode') {
      episode = item;
    } else if (item.type == 'Season') {
      season = item;
    } else if (item.type == 'Movie' || item.type == 'Series') {
      details = item;
    }
  }

  Item getItem(String type) {
    if (type == 'Episode') {
      return episode!;
    } else if (type == 'Movie') {
      return details!;
    } else {
      return details!;
    }
  }

  String getItemImageUrl(Item item, {bool? backdrop = false}) {
    final String path = ImageService.getItemPath(item, backdrop: backdrop);
    if (path.isEmpty) {
      return '';
    } else {
      return '$_address$path';
    }
  }

  String getPersonImageUrl(Person person) {
    final String path = ImageService.getPersonPath(person);
    if (path.isEmpty) {
      return '';
    } else {
      return '$_address$path';
    }
  }

  Future getResumeItems() async {
    try {
      final resp = await _api.get('/Users/$_userId/Items/Resume', query: {
        'Recursive': true,
        'ImageTypeLimit': 1,
        'EnableImageTypes': 'PrimaryImageAspectRatio,BasicSyncInfo',
        'EnableTotalRecordCount': false,
        'Fields':
            'PrimaryImageAspectRatio,BasicSyncInfo,ImageBlurHashes,Height,Width',
        'Limit': 12,
        'MediaTypes': 'Video',
        'IncludeItemTypes': 'Movie,Episode',
      });
      final Items items = Items.fromMap(resp.data);
      resume = items.items;
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future getItemDetails(String itemId, String type) async {
    // Clear data
    clearItems(type);
    try {
      final resp = await _api.get('/Users/$_userId/Items/$itemId', query: {
        'Recursive': true,
        'ImageTypeLimit': 1,
        'EnableImageTypes': 'PrimaryImageAspectRatio,BasicSyncInfo',
        'EnableTotalRecordCount': false,
        'Fields':
            'PrimaryImageAspectRatio,BasicSyncInfo,ImageBlurHashes,Height,Width',
        'Limit': 12,
        'MediaTypes': 'Video',
      });
      final Item item = Item.fromMap(resp.data);
      // Set data
      setItems(item);
      notifyListeners();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future getNextUpShows() async {
    try {
      final resp = await _api.get('/Shows/NextUp', query: {
        'UserId': _userId,
        'Limit': 25,
        'DisableFirstEpisode': true,
      });
      final Items items = Items.fromMap(resp.data);
      nextUp = items.items;
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future getViews() async {
    try {
      final resp = await _api.get('/Users/$_userId/Views');
      final Items data = Items.fromMap(resp.data);
      views = data.items;
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future<List<Item>?> getLatestItems(String parendId) async {
    try {
      final resp = await _api.get('/Users/$_userId/Items/Latest', query: {
        'Limit': 16,
        'ParentId': parendId,
        'IsPlayed': 'false',
      });
      final List<Item> items =
          List<Item>.from(resp.data.map((x) => Item.fromMap(x)));
      return items;
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future<List<Item>?> getItems({
    required String parendId,
    required String includeItemTypes,
    String sortBy = 'PremiereDate,SortName,ProductionYear',
    String sortOrder = 'Ascending',
    bool recursive = true,
  }) async {
    collection = [];
    try {
      final resp = await _api.get('/Users/$_userId/Items', query: {
        'Limit': 100,
        'ParentId': parendId,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'IncludeItemTypes': includeItemTypes,
        'Recursive': recursive.toString()
      });
      final data = Items.fromMap(resp.data);
      collection = data.items;
      notifyListeners();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future getAllLatestItems() async {
    try {
      latest = [];
      for (var view in views) {
        final List<Item>? items = await getLatestItems(view.id);
        final map = {view.id: items!};
        final query = latest.contains(map);
        if (!query) {
          latest.add(map);
        }
      }
      notifyListeners();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future getPlaybackInfo({
    required String type,
    String? audioIndex,
    bool rePlay = true,
  }) async {
    try {
      // get item data
      final item = getItem(type);
      // Get data playback
      final resp = await _api.get('/Items/${item.id}/PlaybackInfo', query: {
        'userId': _userId,
        'IsPlayback': 'true',
      });
      // Parse data
      final data = PlaybackInfo.fromMap(resp.data);
      // set data
      playbackInfo = data;
      // Parse aspect ratio
      final aspectRatio = Utils.calculateAspectRatio(
          data.mediaSources![0].mediaStreams?[0].aspectRatio ?? '');

      // Get video url
      final url = await getVideoUrl(
        itemId: item.id,
        playSessionId: data.playSessionId!,
        audioIndex: audioIndex,
      );

      // Get audios data
      final audios = getAudios(data.mediaSources![0].mediaStreams!);
      // Get subtitles data
      final subtitles = getSubtitles(data.mediaSources![0].mediaStreams!);

      // Set media info
      media = Media(
        name: item.name ?? 'No name',
        type: item.type,
        position: item.userData?.playbackPositionTicks ?? 0,
        rePlay: rePlay,
        audioDefault: data.mediaSources![0].defaultAudioStreamIndex!,
        subtitleDefault: 1,
        url: url,
        aspectRatio: aspectRatio,
        header: await _api.authHeader(),
        audios: audios,
        subtitles: subtitles,
      );
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future<String> getVideoUrl({
    required String itemId,
    required String playSessionId,
    String? audioIndex,
  }) async {
    final url = Uri(path: '/Videos/$itemId/main.m3u8', queryParameters: {
      'PlaySessionId': playSessionId,
      'AudioCodec': 'aac,mp3,ac3,eac3',
      'TranscodingMaxAudioChannels': '4',
      'audioStreamIndex': audioIndex,
      'subtitleMethod': 'Hls',
    });
    return '$_address${url.toString()}';
  }

  List<Audio> getAudios(List<MediaStream> items) {
    final audios = items.where((element) => element.type == 'Audio');
    return audios
        .map((audio) => Audio(
            index: audio.index,
            name: audio.title != null
                ? '${audio.title}'
                : '${audio.displayTitle}'))
        .toList();
  }

  List<Subtitle> getSubtitles(List<MediaStream> items) {
    final subtitle = items.where((element) => element.type == 'Subtitle');
    return subtitle
        .map((subtitle) => Subtitle(
            index: subtitle.index,
            url: '',
            name: subtitle.title != null
                ? '${subtitle.title}'
                : '${subtitle.displayTitle}'))
        .toList();
  }

  Future getSeasons(String seriesId) async {
    // Clear data
    seasons = [];
    try {
      final resp = await _api.get('/Shows/$seriesId/Seasons');
      final data = Items.fromMap(resp.data);
      seasons = data.items;
      notifyListeners();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future getEpisodes(String seriesId, String seasonId) async {
    // Clear data
    episodes = [];
    try {
      final resp = await _api.get('/Shows/$seriesId/Episodes', query: {
        'SeasonId': seasonId,
        'Fields': 'Overview',
      });
      final data = Items.fromMap(resp.data);
      episodes = data.items;
      notifyListeners();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future progress({
    required String playSessionId,
    required int tick,
    bool isPaused = false,
    bool isMuted = false,
  }) async {
    // get item data
    final item = getItem(media!.type);
    try {
      await _api.post(path: '/Sessions/Playing/Progress', data: {
        'ItemId': item.id,
        'CanSeek': true,
        'PlaySessionId': playSessionId,
        'IsPaused': isPaused,
        'IsMuted': isMuted,
        'PlayMethod': 'DirectStream',
        'RepeatMode': 'RepeatNone',
        'PositionTicks': '${tick}0'
      });
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future stopped({
    required String playSessionId,
    required int tick,
  }) async {
    // get item data
    final item = getItem(media!.type);
    try {
      await _api.post(path: '/Sessions/Playing/Stopped', data: {
        'ItemId': item.id,
        'PlaySessionId': playSessionId,
        'Failed': false,
        'PositionTicks': '${tick}0'
      });
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}
