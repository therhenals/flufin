import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/models/item.dart';
import 'package:flufin/screens/episode/widgets.dart';
import 'package:flufin/services/services.dart';
import 'package:flufin/widgets/widgets.dart';

class EpisodeScreen extends StatelessWidget {
  final bool showGoTo;

  const EpisodeScreen({
    Key? key,
    this.showGoTo = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(context);

    final Item? episode = jellyfin.episode;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: (episode == null)
            ? const Loading()
            : SingleChildScrollView(
                padding: showGoTo ? null : const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    ItemImage(
                      item: episode,
                      height: 120,
                      width: 200,
                      backdrop: true,
                    ),
                    const SizedBox(height: 10),
                    EpisodeTitle(episode: episode),
                    ItemActions(center: true, item: episode),
                    const SizedBox(height: 10),
                    if (episode.overview != null)
                      Text(
                        episode.overview!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    const SizedBox(height: 10),
                    if (showGoTo)
                      GoTo(
                        episode: episode,
                      )
                  ],
                ),
              ),
      ),
    );
  }
}
