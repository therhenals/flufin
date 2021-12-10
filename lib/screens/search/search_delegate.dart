import 'package:flutter/material.dart';

class ItemSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar...';

  @override
  List<Widget>? buildActions(BuildContext context) {}

  @override
  Widget? buildLeading(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    return const Center(child: Text('buildResults'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
