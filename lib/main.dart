import 'package:chuck_norris_tinder/jokes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageStatefulWidget();
}

class _HomePageStatefulWidget extends State<HomePage> {
  String randomJoke = "Chuck Norris once look down "
      "at all the destruction and chaos he had caused and he thought it ..... GOOD";
  String welcomeSign = "Press button to update Chuck Norris Joke";

  void _updateJoke() {
    getJoke().then((joke) {
      if (joke.value != "") {
        setState(() {
          randomJoke = joke.value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chuck Norris Application"),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SafeArea(
                child: Text(welcomeSign),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SafeArea(
                child: Text(randomJoke),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateJoke,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
