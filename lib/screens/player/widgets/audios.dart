import 'package:flutter/material.dart';
import 'package:nil/nil.dart';
import 'package:provider/provider.dart';

import 'package:flufin/models/models.dart';
import 'package:flufin/screens/player/widgets.dart';
import 'package:flufin/services/services.dart';

class AudiosPlayer extends StatelessWidget {
  const AudiosPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(context, listen: false);

    final List<Audio>? audios = jellyfin.media?.audios;

    if (audios == null) {
      return nil;
    } else {
      return SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              ...audios
                  .map(
                    (e) => AudioPlayer(
                      audio: e,
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      );
    }
  }
}
