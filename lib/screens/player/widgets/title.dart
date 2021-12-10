import 'package:animate_do/animate_do.dart';
import 'package:flufin/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitlePlayer extends StatelessWidget {
  const TitlePlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(context, listen: false);

    return Positioned.fill(
      child: Align(
        alignment: Alignment.topLeft,
        child: FadeIn(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 23.2,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 10),
                _Name(jellyfin: jellyfin),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({
    Key? key,
    required this.jellyfin,
  }) : super(key: key);

  final JellyfinService jellyfin;

  @override
  Widget build(BuildContext context) {
    return Text(
      jellyfin.media!.name,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
