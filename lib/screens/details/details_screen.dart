import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/i18n/strings.g.dart';
import 'package:flufin/models/models.dart';
import 'package:flufin/screens/details/widgets.dart';
import 'package:flufin/services/services.dart';
import 'package:flufin/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JellyfinService jellyfin = Provider.of<JellyfinService>(context);

    final Item? item = jellyfin.details;

    final List<Person>? people = item?.people;

    final List<Person>? actors = people
        ?.where(
          (person) => person.type == 'Actor',
        )
        .toList();
    final List<Person>? directors = people
        ?.where(
          (person) => person.type == 'Director',
        )
        .toList();

    final List<Person>? writers = people
        ?.where(
          (person) => person.type == 'Writer',
        )
        .toList();

    if (item == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name ?? 'No name'),
      ),
      body: FadeInUp(
        duration: const Duration(milliseconds: 100),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Backdrop(jellyfin: jellyfin, item: item),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TitleAndPlay(
                        item: item,
                      ),
                      const SizedBox(height: 15),
                      if (item.genres != null) ...[
                        Genres(genres: item.genres!),
                        const SizedBox(height: 10),
                      ],
                      if (directors!.isNotEmpty) ...[
                        Team(title: t.directors, people: directors),
                        const SizedBox(height: 10),
                      ],
                      if (writers!.isNotEmpty) ...[
                        Team(title: t.writers, people: writers),
                        const SizedBox(height: 20),
                      ],
                      if (item.overview != null) Overview(text: item.overview!),
                    ],
                  ),
                ),
                if (jellyfin.seasons.isNotEmpty && item.type == 'Series')
                  FadeInUp(
                    child: ItemsSlider(
                      height: 220,
                      width: 130,
                      items: jellyfin.seasons,
                      title: t.seasons,
                    ),
                  ),
                const SizedBox(height: 10),
                if (actors != null) Actors(people: actors),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
