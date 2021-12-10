import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/models/models.dart';
import 'package:flufin/screens/screens.dart';
import 'package:flufin/services/services.dart';
import 'package:flufin/widgets/item_image.dart';

class Episode extends StatelessWidget {
  final Item episode;
  const Episode({
    Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(
      context,
      listen: false,
    );
    return GestureDetector(
      onTap: () {
        jellyfin.getItemDetails(episode.id, episode.type);
        showModalBottomSheet(
          context: context,
          builder: (_) => const EpisodeScreen(
            showGoTo: false,
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemImage(
            item: episode,
            height: 100,
            width: 100,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${episode.indexNumber!}. ' + (episode.name ?? 'No name'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  episode.overview ?? 'No description',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
