import 'package:flufin/ui/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/models/models.dart';
import 'package:flufin/services/services.dart';

class Actor extends StatelessWidget {
  final Person person;
  const Actor({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(
      context,
      listen: false,
    );

    return SizedBox(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: _Image(jellyfin: jellyfin, person: person),
          ),
          const SizedBox(height: 5),
          Text(
            person.name ?? 'No name',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.jellyfin,
    required this.person,
  }) : super(key: key);

  final JellyfinService jellyfin;
  final Person person;

  @override
  Widget build(BuildContext context) {
    String? url = jellyfin.getPersonImageUrl(person);
    if (url.isEmpty) {
      return const Image(
        height: 170,
        width: 130,
        image: AssetImage(FlufinImages.noImage),
        fit: BoxFit.cover,
      );
    } else {
      return FadeInImage(
        height: 170,
        width: 130,
        placeholder: const AssetImage(FlufinImages.loading),
        image: NetworkImage(
          jellyfin.getPersonImageUrl(person),
        ),
        fit: BoxFit.cover,
      );
    }
  }
}
