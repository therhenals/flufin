import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/models/models.dart';
import 'package:flufin/screens/screens.dart';
import 'package:flufin/services/services.dart';
import 'package:flufin/widgets/widgets.dart';

class ItemsSwiper extends StatelessWidget {
  final List<Item> items;
  final String title;
  final double height;
  final bool? backdrop;

  const ItemsSwiper({
    Key? key,
    required this.items,
    required this.title,
    required this.height,
    this.backdrop = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(context, listen: false);
    final size = MediaQuery.of(context).size;

    return (items.isNotEmpty)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: height /* * 1.2 */,
                child: Swiper(
                  loop: items.length < 2 ? false : true,
                  itemCount: items.length,
                  viewportFraction: items.length < 2 ? 0.9 : 0.8,
                  scale: 0.9,
                  itemWidth: size.width * 0.8,
                  itemHeight: height,
                  itemBuilder: (BuildContext _, int index) {
                    final item = items[index];
                    return Stack(
                      children: [
                        ItemDetails(
                          item: item,
                          height: height,
                          width: double.infinity,
                          backdrop: backdrop,
                          onTap: () {
                            jellyfin.getItemDetails(item.id, item.type);
                            goTo(context, item);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          )
        : const SizedBox();
  }

  goTo(BuildContext context, Item item) {
    if (item.type == 'Episode') {
      showModalBottomSheet(
        context: context,
        builder: (_) => const EpisodeScreen(),
      );
    } else if (item.type == 'Movie') {
      Navigator.pushNamed(context, 'details');
    }
  }
}
