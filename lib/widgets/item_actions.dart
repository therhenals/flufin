import 'package:flufin/i18n/strings.g.dart';
import 'package:flufin/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/models/models.dart';
import 'package:flufin/services/services.dart';

class ItemActions extends StatelessWidget {
  final Item item;
  final bool center;

  const ItemActions({
    Key? key,
    required this.center,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          center ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        _PlayButton(
          type: item.type,
        ),
        const SizedBox(width: 6),
        if (item.userData?.playedPercentage != null &&
            (item.type == 'Movie' || item.type == 'Episode'))
          _RePlayButton(type: item.type),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  final String type;
  const _PlayButton({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(context, listen: false);
    final player = Provider.of<PlayerProvider>(context, listen: false);

    return OutlinedButton(
      child: Row(
        children: [
          const Icon(
            Icons.play_arrow_rounded,
            size: 30,
          ),
          const SizedBox(width: 5),
          Text(t.play)
        ],
      ),
      onPressed: () async {
        await jellyfin.getPlaybackInfo(rePlay: false, type: type);
        await Navigator.of(context).pushNamed('player');
        if (jellyfin.playbackInfo?.playSessionId != null) {
          jellyfin.stopped(
            playSessionId: jellyfin.playbackInfo!.playSessionId!,
            tick: player.position!.inMicroseconds,
          );
        }
      },
    );
  }
}

class _RePlayButton extends StatelessWidget {
  final String type;
  const _RePlayButton({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: const Icon(
        Icons.replay_rounded,
        size: 30,
      ),
      onPressed: () async {
        final jellyfin = Provider.of<JellyfinService>(context, listen: false);
        await jellyfin.getPlaybackInfo(
          type: type,
        );
        Navigator.of(context).pushNamed('player');
      },
    );
  }
}
