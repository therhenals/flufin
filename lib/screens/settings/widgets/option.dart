import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  const Option({
    required this.text,
    this.onTap,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      onTap: onTap,
    );
  }
}
