import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      )
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  var favorites = <WordPair>[];

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SafeArea(child: NavigationRail( // <1>
            extended: false, // <2>
            destinations: [
              NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(icon: Icon(Icons.favorite), label: Text('Favorites'))
            ],
            selectedIndex: 0,
            onDestinationSelected: (value) {
              print('Selected: $value');
            },
          )
          ),
          Expanded(child: Container( // <3>
            color: Theme.of(context).colorScheme.primaryContainer,
              child: GeneratorPage()) // <4>
          ),
        ],
      ),
    );
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(onPressed: () {
                appState.toggleFavorite();
                }, icon: Icon(icon), label: Text('Like')),
              SizedBox(width: 10),
              ElevatedButton(onPressed: () {
                appState.getNext();},
                  child: Text('Next')),
            ],
          )
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(pair.asLowerCase, style: style, semanticsLabel: "${pair.first} ${pair.second}",),
      ),
    );
  }
}
