import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flufin/providers/providers.dart';
import 'package:flufin/screens/screens.dart';
import 'package:flufin/screens/tabs/widgets.dart';
import 'package:flufin/services/services.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    final jellyfin = Provider.of<JellyfinService>(context, listen: false);
    jellyfin.getInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flufin'),
        centerTitle: true,
        /* leading: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => showSearch(
            context: context,
            delegate: ItemSearchDelegate(),
          ),
        ), */
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'settings');
            },
            icon: const Icon(Icons.settings_outlined),
          )
        ],
      ),
      body: const _TabsPageBody(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class _TabsPageBody extends StatelessWidget {
  const _TabsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectMenuOpt;

    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const LibraryScreen();
      /* case 2:
        return const FavoritesScreen(); */
      default:
        return const HomeScreen();
    }
  }
}
