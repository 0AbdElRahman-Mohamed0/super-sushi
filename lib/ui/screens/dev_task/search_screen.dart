import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:super_sushi/providers/repo_provider.dart';
import 'package:super_sushi/ui/widgets/dev_task/repo_card.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';

class SearchScreen extends SearchDelegate<String> {
  SearchScreen({this.context, required this.initialList}) {
    filteredList = List.of(initialList);
  }

  BuildContext? context;
  List<dynamic> initialList;
  List<dynamic> filteredList = [];

  @override
  String get searchFieldLabel => tr('search_repo');

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, 'null');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<dynamic> items = filteredList
        .where((element) =>
            (element.name!.contains(RegExp(query, caseSensitive: false))))
        .toList();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(
          horizontal: MagicNumbers.MARGIN_SIZE_DEFAULT,
          vertical: MagicNumbers.MARGIN_SIZE_SMALL),
      itemCount: items.length,
      itemBuilder: (content, index) => ChangeNotifierProvider<RepoProvider>(
        key: Key(items[index].id.toString()),
        create: (_) => RepoProvider(items[index]),
        child: const RepoCard(),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<dynamic> items = filteredList
        .where((element) =>
            (element.name!.contains(RegExp(query, caseSensitive: false))))
        .toList();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(
          horizontal: MagicNumbers.MARGIN_SIZE_DEFAULT,
          vertical: MagicNumbers.MARGIN_SIZE_SMALL),
      itemCount: items.length,
      itemBuilder: (content, index) => ChangeNotifierProvider<RepoProvider>(
        key: Key(items[index].id.toString()),
        create: (_) => RepoProvider(items[index]),
        child: const RepoCard(),
      ),
    );
  }
}
