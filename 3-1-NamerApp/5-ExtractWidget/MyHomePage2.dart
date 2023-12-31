
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    return Scaffold(
        body: Center( // <1>
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigCard(pair: pair),
              SizedBox(height: 10), // <2>
              ElevatedButton(onPressed: () {
                appState.getNext();
              }, child: Text('Next'))
            ],
          ),
        )
    );
  }
}
