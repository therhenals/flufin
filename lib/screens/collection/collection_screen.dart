import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/services/services.dart';
import 'package:flufin/widgets/widgets.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(context);
    String name = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: (jellyfin.collection.isEmpty)
          ? // Loading
          const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.6,
              ),
              itemCount: jellyfin.collection.length,
              itemBuilder: (_, int i) {
                final item = jellyfin.collection[i];
                return ItemDetails(
                  item: item,
                  height: 300,
                  width: 200,
                  onTap: () async {
                    if (item.type == 'Movie') {
                      Navigator.pushNamed(context, 'details');
                    } else if (item.type == 'Series') {
                      jellyfin.getSeasons(item.id);
                      Navigator.pushNamed(context, 'details');
                    }
                  },
                );
              },
            ),
    );
  }
}
