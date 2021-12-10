import 'package:flufin/models/models.dart';
import 'package:flutter/material.dart';

class EpisodeTitle extends StatelessWidget {
  final Item episode;

  const EpisodeTitle({
    Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'S${episode.parentIndexNumber}:E${episode.indexNumber} - ' +
          (episode.name ?? 'No name'),
      style: const TextStyle(fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
