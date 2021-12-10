import 'package:flufin/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flufin/i18n/strings.g.dart';
import 'package:flufin/screens/settings/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SectionTitle(
            text: t.server,
          ),
          /* ListTile(
            title: Text(t.changeServer),
            leading: const Icon( Icons.storage_rounded),
            onTap: () {
              Navigator.pushNamed(context, 'server');
            },
          ), */
          Option(
            text: t.logout,
            icon: Icons.logout_rounded,
            onTap: () async {
              final auth = Provider.of<AuthService>(context, listen: false);
              await auth.deleteAll();
              Navigator.pushNamedAndRemoveUntil(
                context,
                'server',
                (route) => false,
              );
            },
          ),
          const Divider(
            height: 5,
          ),
          SectionTitle(
            text: t.about,
          ),
          Option(
            text: t.privacyPolicy,
            icon: Icons.privacy_tip_rounded,
            onTap: () async {
              await launch('https://github.com/therhenals/flufin');
            },
          ),
          Option(
            text: t.appInformation,
            icon: Icons.help_rounded,
            onTap: () {
              Navigator.pushNamed(context, 'appInformation');
            },
          ),
        ],
      ),
    );
  }
}
