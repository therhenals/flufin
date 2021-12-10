import 'package:flufin/i18n/strings.g.dart';
import 'package:flutter/material.dart';

import 'package:flufin/models/jellyfin/person.dart';
import 'package:flufin/screens/details/widgets.dart';

class Actors extends StatelessWidget {
  final List<Person> people;

  const Actors({
    Key? key,
    required this.people,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actors = people.where((person) => person.type == 'Actor').toList();

    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            child: Text(
              t.cast,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: actors.length,
              itemBuilder: (_, int i) => Container(
                child: Actor(
                  person: actors[i],
                ),
                margin: EdgeInsets.only(
                  left: 20,
                  right: actors.length == i + 1 ? 20 : 0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
