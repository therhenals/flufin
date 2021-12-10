import 'package:flufin/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/services/services.dart';
import 'package:flufin/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jellyfin = Provider.of<JellyfinService>(context);

    // Loading
    if (!jellyfin.initial) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).colorScheme.background,
      onRefresh: () async {
        jellyfin.setInitial = false;
        jellyfin.getInitialData();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              ItemsSwiper(
                title: t.continueWatching,
                items: jellyfin.resume,
                height: 210,
                backdrop: true,
              ),
              ItemsSlider(
                title: t.nextUp,
                items: jellyfin.nextUp,
                height: 150,
                width: 200,
                backdrop: true,
              ),
              ...jellyfin.latest.map((item) {
                String title = jellyfin.views
                    .where((view) => view.id == item.keys.first)
                    .first
                    .name!;
                return ItemsSlider(
                  title: '${t.latest} $title',
                  items: item.values.first,
                  height: 250,
                  width: 150,
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
