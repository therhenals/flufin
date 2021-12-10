import 'package:flutter/material.dart';
import 'package:flufin/models/jellyfin/person.dart';
import 'package:flufin/utils.dart';

class Team extends StatelessWidget {
  final String title;
  final List<Person> people;

  const Team({
    Key? key,
    required this.title,
    required this.people,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strings = people.map((person) => person.name).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Flexible(child: Text(Utils.listToString(strings))),
      ],
    );
  }
}
