import 'package:flufin/i18n/strings.g.dart';
import 'package:flufin/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationRail extends StatelessWidget {
  const CustomNavigationRail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectMenuOpt;

    return NavigationRail(
      selectedIconTheme: const IconThemeData(
        size: 30,
      ),
      selectedIndex: currentIndex,
      onDestinationSelected: (int i) => uiProvider.selectMenuOpt = i,
      destinations: [
        NavigationRailDestination(
          icon: const Icon(Icons.home_rounded),
          label: Text(t.home),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.my_library_books_rounded),
          label: Text(t.library),
        ),
        /* NavigationRailDestination(
          icon: const Icon(Icons.favorite_rounded),
          label: Text(t.library),
        ), */
      ],
    );
  }
}
