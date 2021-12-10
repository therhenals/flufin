import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/services/services.dart';
import 'package:flufin/widgets/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Services
    final server = Provider.of<ServerService>(context, listen: false);
    final auth = Provider.of<AuthService>(context, listen: false);
    final jellyfin = Provider.of<JellyfinService>(context, listen: false);

    final size = MediaQuery.of(context).size;

    goTo(String route) {
      Future.microtask(() {
        Navigator.pushReplacementNamed(context, route);
      });
    }

    Future<String> getInitialData() async {
      final address = await server.readServer();
      final token = await auth.readToken();
      final userId = await auth.readUserId();

      if (address.isEmpty) return 'server';

      if (token.isEmpty) return 'auth';

      // Init data
      jellyfin.address = address;
      jellyfin.userId = userId;
      return '';
    }

    return Scaffold(
      body: GradientBackground(
        child: FutureBuilder(
          future: getInitialData(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            /*  Timer(const Duration(milliseconds: 500), () { */
            if (snapshot.hasData) {
              if (snapshot.data == 'server') {
                goTo('server');
              } else if (snapshot.data == 'auth') {
                goTo('login');
              } else {
                goTo('tabs');
              }
            }
            /* }); */

            return SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.5),
                  const CircularProgressIndicator()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
