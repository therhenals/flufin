import 'dart:async';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

import 'package:flufin/providers/player_provider.dart';
import 'package:flufin/screens/player/widgets/title.dart';
import 'package:flufin/services/services.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late Timer _timerProgress;

  @override
  void initState() {
    final player = Provider.of<PlayerProvider>(context, listen: false);

    player.initController(context);

    // set progress
    const timerDuration = Duration(seconds: 3);

    _timerProgress = Timer.periodic(timerDuration, (_) {
      if (player.position != null) {
        player.progress();
      }
    });

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    // Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // Set portrait orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    Wakelock.disable();
    _timerProgress.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<PlayerProvider>(context);
    final jellyfin = Provider.of<JellyfinService>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: jellyfin.media!.aspectRatio,
          child: Stack(
            fit: StackFit.expand,
            children: [
              BetterPlayer(
                controller: player.controller,
              ),
              if (player.visible) const TitlePlayer(),
            ],
          ),
        ),
      ),
    );
  }
}
