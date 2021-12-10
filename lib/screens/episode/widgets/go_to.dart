import 'package:flufin/i18n/strings.g.dart';
import 'package:flufin/models/models.dart';
import 'package:flufin/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoTo extends StatelessWidget {
  final Item episode;
  const GoTo({
    Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(context, listen: false);

    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              jellyfin.getItemDetails(episode.seriesId!, 'Series');
              jellyfin.getSeasons(episode.seriesId!);
              Navigator.pushNamed(context, 'details');
            },
            child: Text(
              '${t.goTo} ' + (episode.seriesName ?? 'No series name'),
              style: const TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }
}
