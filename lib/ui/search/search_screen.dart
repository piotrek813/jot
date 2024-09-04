
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/model/chote.dart';
import 'package:jot_notes/service/chote_service.dart';
import 'package:jot_notes/ui/search/search_appbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_screen.g.dart';

final queryProvider = StateProvider<String>((ref) {
  return "";
});

@riverpod
Future<List<Chote>> searchResults(SearchResultsRef ref) {
  final choteService = ref.watch(choteServiceProvider);
  final query = ref.watch(queryProvider);

  return choteService.query(query);
}

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(searchResultsProvider).valueOrNull;

    final hasResults = results != null && results.isNotEmpty;

    final theme = Theme.of(context);
    final appBarTheme = theme.copyWith(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: theme.colorScheme.brightness == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        backgroundColor: theme.colorScheme.brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
        titleTextStyle: theme.textTheme.titleLarge,
        toolbarTextStyle: theme.textTheme.bodyMedium,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: theme.inputDecorationTheme.hintStyle,
        border: InputBorder.none,
      ),
    );

    return Theme(
        data: appBarTheme,
        child: Scaffold(
          appBar: const SearchAppBar(),
          body: hasResults
              ? ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final item = results[index];
                    return ListTile(title: Text(item.text));
                  },
                )
              : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tak pusto, że aż smutno",
                        style: theme.textTheme.titleLarge,
                      ),
                      const Text("Weź no spróbuj jescze raz")
                    ],
                  ),
              ),
        ));
  }
}
