import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

void main() {
  runApp(const PopupMenuApp());
}

class PopupMenuApp extends StatelessWidget {
  const PopupMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PopupMenuExample(),
    );
  }
}

class PopupMenuExample extends StatefulWidget {
  const PopupMenuExample({super.key});

  @override
  State<PopupMenuExample> createState() => _PopupMenuExampleState();
}

class _PopupMenuExampleState extends State<PopupMenuExample> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PopupMenuButton'),),
      body: Center(
        child: PopupMenuButton<SampleItem>(
          initialValue: selectedItem,
          onSelected: (SampleItem result) {
            setState(() {
              selectedItem = result;
            });
          },  
          itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemOne,
              child: Text('Item One'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemTwo,
              child: Text('Item Two'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemThree,
              child: Text('Item Three'),
            ),
          ],
        )
      ),
    );
  }
}