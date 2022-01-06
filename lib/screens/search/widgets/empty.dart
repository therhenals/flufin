import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.movie_rounded,
        color: Theme.of(context).primaryColor,
        size: 130,
      ),
    );
  }
}
