import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flufin/i18n/strings.g.dart';
import 'package:flufin/ui/images.dart';

class AppInformationScreen extends StatelessWidget {
  const AppInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.appInformation),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(FlufinImages.icon),
              width: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              'Flufin',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const _Version(),
            const SizedBox(height: 30),
            Text(
              '${t.developerBy} TheRhenals',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                await launch('https://github.com/therhenals/flufin');
              },
              child: Text('${t.sourceCodeMsg} Github'),
            ),
            TextButton(
              onPressed: () async {
                final package = await PackageInfo.fromPlatform();
                final String version = package.version;
                final String buildNumber = package.buildNumber;

                showLicensePage(
                  context: context,
                  applicationIcon: const Image(
                    image: AssetImage(FlufinImages.icon),
                    width: 100,
                  ),
                  applicationVersion: '${t.version} $version ($buildNumber)',
                  applicationLegalese:
                      'Third-party Flutter application for Jellyfin',
                );
              },
              child: const Text('Licenses'),
            )
          ],
        ),
      ),
    );
  }
}

class _Version extends StatelessWidget {
  const _Version({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
        if (snapshot.hasData) {
          final String version = snapshot.data?.version ?? 'Version?';
          final String buildNumber = snapshot.data?.buildNumber ?? 'number?';

          return Text('${t.version} $version ($buildNumber)');
        }

        return Container();
      },
    );
  }
}
