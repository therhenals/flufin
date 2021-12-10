import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  final String text;
  const Overview({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
