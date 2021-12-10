import 'package:flufin/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/providers/providers.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectMenuOpt;

    return BottomNavigationBar(
      selectedIconTheme: const IconThemeData(
        size: 30,
      ),
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_rounded),
          label: t.home,
          tooltip: t.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.my_library_books_rounded),
          label: t.library,
          tooltip: t.library,
        ),
        /* BottomNavigationBarItem(
          icon: Icon(Icons.favorite_rounded),
          label: 'Favorites',
          tooltip: 'Favorites',
        ), */
      ],
      onTap: (int i) => uiProvider.selectMenuOpt = i,
    );
  }
}
