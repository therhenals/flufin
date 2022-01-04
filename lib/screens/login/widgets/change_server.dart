import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/i18n/strings.g.dart';
import 'package:flufin/services/services.dart';

class ChangeServer extends StatelessWidget {
  const ChangeServer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final auth = Provider.of<AuthService>(context, listen: false);
        await auth.deleteAll();
        Navigator.pushNamedAndRemoveUntil(
          context,
          'server',
          (route) => false,
        );
      },
      child: Text(t.changeServer),
    );
  }
}
