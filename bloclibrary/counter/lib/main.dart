import 'package:counter/counter/view/counter_page.dart';
import 'package:counter/counter_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}

class CounterApp extends MaterialApp {
  const CounterApp({super.key}) : super(home: const CounterPage());
}

