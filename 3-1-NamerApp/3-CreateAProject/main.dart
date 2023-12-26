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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange), // <1>
          useMaterial3: true,
        ),
        home: MyHomePage(),
      )
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add provider package to use context.watch
    var appState = context.watch<MyAppState>();
    return Scaffold(
      body: Column(
        children: [
          Text('A random idea.'),
          Text(appState.current.asLowerCase),
        ],
      )
    );
  }
}
