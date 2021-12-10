import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/screens/season/widgets.dart';
import 'package:flufin/services/services.dart';

class SeasonScreen extends StatelessWidget {
  const SeasonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(context);
    String name = ModalRoute.of(context)!.settings.arguments as String;

    final episodes = jellyfin.episodes;

    if (episodes.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: episodes.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (_, int i) {
            return Episode(
              episode: episodes[i],
            );
          },
        ),
      ),
    );
  }
}
