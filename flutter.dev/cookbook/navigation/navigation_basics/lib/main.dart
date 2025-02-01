import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Route')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push( // <1>
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondRoute()));
            },
            child: const Text('Open route')),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Route')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // <2>
            },
            child: const Text('Go back!')),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}
