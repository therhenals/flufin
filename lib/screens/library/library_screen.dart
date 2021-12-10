import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/services/services.dart';
import 'package:flufin/widgets/widgets.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(context);

    // Loading
    if (!jellyfin.initial) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: jellyfin.views.length,
            itemBuilder: (_, int i) {
              final collection = jellyfin.views[i];
              return ItemDetails(
                item: collection,
                height: 120,
                width: 300,
                backdrop: true,
                onTap: () async {
                  jellyfin.getItems(
                    parendId: collection.id,
                    includeItemTypes: collection.collectionType == 'movies'
                        ? 'Movie'
                        : 'Series',
                  );
                  Navigator.pushNamed(
                    context,
                    'collection',
                    arguments: collection.name ?? 'No name',
                  );
                },
              );
            }),
      ),
    );
  }
}
