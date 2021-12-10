import 'package:flufin/models/models.dart';
import 'package:flufin/services/services.dart';
import 'package:flufin/ui/images.dart';
import 'package:flutter/material.dart';

class Backdrop extends StatelessWidget {
  const Backdrop({
    Key? key,
    required this.jellyfin,
    required this.item,
  }) : super(key: key);

  final JellyfinService jellyfin;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      width: double.infinity,
      height: 220,
      placeholder: const AssetImage(FlufinImages.loading),
      image: NetworkImage(
        jellyfin.getItemImageUrl(
          item,
          backdrop: true,
        ),
      ),
      fit: BoxFit.cover,
    );
  }
}
