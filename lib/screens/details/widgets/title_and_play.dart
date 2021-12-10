import 'package:flutter/material.dart';

import 'package:flufin/models/models.dart';
import 'package:flufin/widgets/widgets.dart';

class TitleAndPlay extends StatelessWidget {
  final Item item;
  const TitleAndPlay({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.name ?? 'No name',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (item.originalTitle != null)
            Text(
              item.originalTitle!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          if (item.type == 'Episode' || item.type == 'Movie') ...[
            const SizedBox(height: 5),
            ItemActions(center: false, item: item),
          ],
        ],
      ),
    );
  }
}
