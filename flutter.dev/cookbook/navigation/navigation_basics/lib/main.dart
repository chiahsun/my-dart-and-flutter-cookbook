import 'package:flutter/cupertino.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: const Text('First Route')),
      child: Center(
        child: CupertinoButton(
            onPressed: () {
              Navigator.push( // <1>
                  context,
                  CupertinoPageRoute(
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: const Text('Second Route')),
      child: Center(
        child: CupertinoButton(
            onPressed: () {
              Navigator.pop(context); // <2>
            },
            child: const Text('Go back!')),
      ),
    );
  }
}

void main() {
  runApp(const CupertinoApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}
