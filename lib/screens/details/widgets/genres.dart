import 'package:flufin/i18n/strings.g.dart';
import 'package:flutter/material.dart';

import 'package:flufin/utils.dart';

class Genres extends StatelessWidget {
  final List<String> genres;

  const Genres({Key? key, required this.genres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.genres,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Flexible(child: Text(Utils.listToString(genres))),
      ],
    );
  }
}
