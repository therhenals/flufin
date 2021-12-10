import 'dart:async';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

import 'package:flufin/screens/player/widgets/audios.dart';
import 'package:flufin/services/services.dart';

class PlayerProvider extends ChangeNotifier {
  late final JellyfinService _jellyfin;
  late BuildContext _context;

  PlayerProvider();

  PlayerProvider.setJellyfin(JellyfinService jellyfin) {
    _jellyfin = jellyfin;
  }

  late BetterPlayerController controller;

  bool visible = true;

  late int audioIndex;
  late int subtitleIndex;

  Duration? position;

  listen(BetterPlayerEvent event) async {
    final type = event.betterPlayerEventType;
    if (type == BetterPlayerEventType.initialized) {
      _initialized();
    } else if (type == BetterPlayerEventType.controlsVisible) {
      _controlsVisible();
    } else if (type == BetterPlayerEventType.controlsHiddenStart) {
      _controlsHidden();
    } else if (type == BetterPlayerEventType.pause) {
      Wakelock.disable();
    } else if (type == BetterPlayerEventType.play) {
      Wakelock.enable();
    } else if (type == BetterPlayerEventType.finished) {
      finished();
    } else if (type == BetterPlayerEventType.exception) {
      finished();
    } else if (type == BetterPlayerEventType.progress) {
      position = (await controller.videoPlayerController!.position)!;
    }
  }

  Future<void> _initialized() async {
    if (_jellyfin.media!.rePlay == false) {
      await controller.seekTo(
        Duration(
          microseconds: (_jellyfin.media!.position ~/ 10).toInt(),
        ),
      );
    }
    await controller.play();
  }

  void _controlsVisible() {
    visible = true;
    notifyListeners();
  }

  void _controlsHidden() {
    visible = false;
    notifyListeners();
  }

  Future<void> progress() async {
    _jellyfin.progress(
      playSessionId: _jellyfin.playbackInfo!.playSessionId!,
      tick: position!.inMicroseconds,
    );
  }

  Future<void> finished() async {
    await stopped();
    Navigator.pop(_context);
  }

  Future<void> stopped() async {
    _jellyfin.stopped(
      playSessionId: _jellyfin.playbackInfo!.playSessionId!,
      tick: position!.inMicroseconds,
    );
  }

  Future initController(BuildContext context) async {
    _context = context;
    audioIndex = _jellyfin.media!.audioDefault;
    subtitleIndex = _jellyfin.media!.subtitleDefault;
    position = null;

    controller = BetterPlayerController(
      BetterPlayerConfiguration(
        aspectRatio: _jellyfin.media!.aspectRatio,
        autoPlay: true,
        controlsConfiguration: _controlsConfiguration(),
      ),
      betterPlayerDataSource: _dataSource(),
    );

    /* _jellyfin.media!.subtitles!.map(
      (subtitle) => controller.setupSubtitleSource(
        BetterPlayerSubtitlesSource(
          name: subtitle.name,
          urls: [subtitle.url],
        ),
      ),
    ); */

    controller.addEventsListener(listen);
  }

  BetterPlayerDataSource _dataSource() {
    return BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      _jellyfin.media!.url,
      headers: {
        'x-emby-authorization': _jellyfin.media!.header,
      },
      videoFormat: BetterPlayerVideoFormat.hls,
    );
  }

  BetterPlayerControlsConfiguration _controlsConfiguration() {
    return BetterPlayerControlsConfiguration(
      playerTheme: BetterPlayerTheme.cupertino,
      enableAudioTracks: false,
      enableQualities: false,
      enableFullscreen: false,
      overflowMenuCustomItems: [
        _audios(),
      ],
    );
  }

  BetterPlayerOverflowMenuItem _audios() {
    return BetterPlayerOverflowMenuItem(
      Icons.audiotrack_rounded,
      'Audios',
      () {
        showModalBottomSheet(
          context: _context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return const AudiosPlayer();
          },
        );
      },
    );
  }
}
