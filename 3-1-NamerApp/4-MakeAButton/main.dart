import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp()); // <1>
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( // <1>
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

class MyAppState extends ChangeNotifier { // <2>
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>(); // <1>
    return Scaffold(
      body: Column(
        children: [
          Text('A random AWESOME idea.'),
          Text(appState.current.asLowerCase),

          ElevatedButton(onPressed: () { // <2>
            print('Button pressed!');
          }, child: Text('Next'))
        ],
      )
    );
  }
}