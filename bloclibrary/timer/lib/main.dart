import 'package:flutter/material.dart';
import 'package:timer/timer/view/timer_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Timer",
     home: TimerPage(),
      );
  }
}

