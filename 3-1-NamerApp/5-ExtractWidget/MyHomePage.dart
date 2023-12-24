
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, // <1>
          children: [
            Text('A random AWESOME idea.'),
            BigCard(pair: pair),

            ElevatedButton(onPressed: () {
              appState.getNext();
            }, child: Text('Next'))
          ],
        )
    );
  }
}