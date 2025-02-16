import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second'); // <1>
            },
            child: const Text('Launch screen')),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
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
  runApp(MaterialApp(title: 'Named Routes Demo', initialRoute: '/', routes: {
    '/': (context) => const FirstScreen(),
    '/second': (context) => const SecondScreen(),
  }));
}
