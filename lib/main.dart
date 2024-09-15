import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /*all in terms of things that you see on the scree is widget*/
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Random Name',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 0, 255)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  //normal class, anyonde who watch this wanna be update themselves
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState =
        context.watch<MyAppState>(); //appState = i want to rebuid every time

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea for:'),
          Text(appState.current
              .asPascalCase), //use too LowerCase,UpperCase or SnakeCase!
          ElevatedButton(
            onPressed: () {
              appState.getNext();
            },
            child: Text('Random'),
          ),
        ],
      ),
    );
  }
}
