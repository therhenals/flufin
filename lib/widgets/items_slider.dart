import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/models/models.dart';
import 'package:flufin/screens/screens.dart';
import 'package:flufin/services/services.dart';
import 'package:flufin/widgets/widgets.dart';

class ItemsSlider extends StatelessWidget {
  final List<Item> items;
  final String title;
  final double height;
  final double width;
  final bool backdrop;

  const ItemsSlider({
    Key? key,
    required this.items,
    required this.title,
    required this.height,
    required this.width,
    this.backdrop = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(context);
    return (items.isNotEmpty)
        ? SizedBox(
            width: double.infinity,
            height: height + (backdrop ? 55 : 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      separatorBuilder: (_, __) => const SizedBox(width: 20),
                      itemBuilder: (_, int index) {
                        final item = items[index];
                        return ItemDetails(
                          item: item,
                          height: height,
                          width: width,
                          backdrop: backdrop,
                          year: true,
                          onTap: () {
                            jellyfin.getItemDetails(item.id, item.type);
                            goTo(context, item);
                          },
                        );
                      }),
                ),
              ],
            ),
          )
        : const SizedBox();
  }

  goTo(BuildContext context, Item item) {
    final jellyfin = Provider.of<JellyfinService>(context, listen: false);
    if (item.type == 'Episode') {
      showModalBottomSheet(
        context: context,
        builder: (_) => const EpisodeScreen(),
      );
    } else if (item.type == 'Movie') {
      Navigator.pushNamed(context, 'details');
    } else if (item.type == 'Series') {
      jellyfin.getSeasons(item.id);
      Navigator.pushNamed(context, 'details');
    } else if (item.type == 'Season') {
      jellyfin.getEpisodes(item.seriesId!, item.id);
      Navigator.pushNamed(context, 'season', arguments: item.name);
    }
  }
}
