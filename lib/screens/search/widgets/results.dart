import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/models/models.dart';
import 'package:flufin/screens/search/widgets.dart';
import 'package:flufin/services/services.dart';
import 'package:flufin/widgets/widgets.dart';

class Results extends StatelessWidget {
  final String query;

  const Results({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(
      context,
      listen: false,
    );

    Future<List<Item>?> getMovies = jellyfin.getItems(
      searchTerm: query,
      includePeople: false,
      includeMedia: false,
      includeGenres: false,
      includeStudios: false,
      includeArtists: false,
      includeItemTypes: 'Movie',
    );

    Future<List<Item>?> getShows = jellyfin.getItems(
      searchTerm: query,
      includePeople: false,
      includeMedia: false,
      includeGenres: false,
      includeStudios: false,
      includeArtists: false,
      includeItemTypes: 'Series',
    );

    Future<List<Item>?> getEpisodes = jellyfin.getItems(
      searchTerm: query,
      includePeople: false,
      includeMedia: false,
      includeGenres: false,
      includeStudios: false,
      includeArtists: false,
      includeItemTypes: 'Episode',
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            FutureBuilder(
              future: getMovies,
              builder: (_, AsyncSnapshot<List<Item>?> snapshot) {
                if (snapshot.hasData) {
                  return ItemsSlider(
                    title: 'Movies',
                    items: snapshot.data!,
                    height: 250,
                    width: 150,
                  );
                }
                return Container();
              },
            ),
            FutureBuilder(
              future: getShows,
              builder: (_, AsyncSnapshot<List<Item>?> snapshot) {
                if (snapshot.hasData) {
                  return ItemsSlider(
                    title: 'Shows',
                    items: snapshot.data!,
                    height: 250,
                    width: 150,
                  );
                }
                return Container();
              },
            ),
            FutureBuilder(
              future: getEpisodes,
              builder: (_, AsyncSnapshot<List<Item>?> snapshot) {
                if (snapshot.hasData) {
                  return ItemsSlider(
                    title: 'Episodes',
                    items: snapshot.data!,
                    height: 150,
                    width: 200,
                    backdrop: true,
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
