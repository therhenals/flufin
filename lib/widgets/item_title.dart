import 'package:flutter/material.dart';

import 'package:flufin/models/models.dart';

class ItemTitle extends StatelessWidget {
  final Item item;

  const ItemTitle({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = 'No name';
    if (item.type == 'Movie' ||
        item.type == 'Series' ||
        item.type == 'CollectionFolder' ||
        item.type == 'Season') {
      text = item.name ?? 'No name';
    } else if (item.type == 'Episode') {
      text = item.seriesName ?? 'No series name';
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        if (item.type == 'Episode')
          Text(
            'S${item.parentIndexNumber}:E${item.indexNumber} - ${item.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
      ],
    );
  }
}
