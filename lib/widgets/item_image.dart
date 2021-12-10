import 'package:flufin/ui/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/models/models.dart';
import 'package:flufin/services/services.dart';

class ItemImage extends StatelessWidget {
  final Item item;
  final double height;
  final double width;
  final bool? backdrop;

  const ItemImage({
    Key? key,
    this.backdrop = false,
    required this.item,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(context, listen: false);
    String? url = jellyfin.getItemImageUrl(item, backdrop: backdrop);

    if (url.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          height: height,
          width: width,
          image: const AssetImage(FlufinImages.noImage),
          fit: BoxFit.cover,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FadeInImage(
          height: height,
          width: width,
          placeholder: const AssetImage(FlufinImages.loading),
          image: NetworkImage(
            url,
          ),
          fit: BoxFit.cover,
        ),
      );
    }
  }
}
