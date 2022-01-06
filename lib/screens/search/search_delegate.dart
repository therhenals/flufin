import 'package:flutter/material.dart';

import 'package:flufin/screens/search/widgets.dart';

class ItemSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar...';

  @override
  List<Widget>? buildActions(BuildContext context) {}

  @override
  Widget? buildLeading(BuildContext context) {}

  @override
  buildResults(BuildContext context) {
    return Results(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Empty();
  }
}
