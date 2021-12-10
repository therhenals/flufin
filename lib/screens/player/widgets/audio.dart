import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/models/models.dart';
import 'package:flufin/providers/providers.dart';
import 'package:flufin/services/services.dart';

class AudioPlayer extends StatelessWidget {
  final Audio audio;
  const AudioPlayer({
    Key? key,
    required this.audio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<PlayerProvider>(context);
    final jellyfin = Provider.of<JellyfinService>(context, listen: false);

    final videoController = player.controller.videoPlayerController!;

    final selected = audio.index == 1;

    return ListTile(
      dense: true,
      leading: selected
          ? const Icon(
              Icons.check_rounded,
              color: Colors.black,
            )
          : null,
      minLeadingWidth: 0,
      title: Text(
        audio.name,
        style: TextStyle(
          fontWeight: selected ? FontWeight.bold : null,
          color: Colors.black,
        ),
      ),
      selected: selected,
      onTap: () async {
        Navigator.pop(context);
        if (!selected) {
          final tick = videoController.value.position.inMicroseconds;

          await jellyfin.getPlaybackInfo(
            audioIndex: '${audio.index}',
            type: jellyfin.media!.type,
          );

          await player.controller.setupDataSource(
            BetterPlayerDataSource(
              BetterPlayerDataSourceType.network,
              jellyfin.media!.url,
              headers: {
                'x-emby-authorization': jellyfin.media!.header,
              },
              videoFormat: BetterPlayerVideoFormat.hls,
            ),
          );

          player.audioIndex = audio.index;
          await player.controller.seekTo(Duration(microseconds: tick));
        }
      },
    );
  }
}
