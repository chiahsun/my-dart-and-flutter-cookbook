import 'package:flutter/material.dart';

void main() {
  runApp(const AppBarApp());
}

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_alert), tooltip: 'Show Snackbar', onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This is a snackbar'))
            );
          },),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NextPage()));
          }, icon: const Icon(Icons.navigate_next),
          tooltip: 'Go to the next page',)
        ],
      ),
      body: const Center(
        child: Text('This is the home page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: const Center(
        child: Text('This is the next page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}