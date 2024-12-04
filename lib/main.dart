import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// класс компонент которое не может хранить состояние и не обновляет его
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Randomizer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Randomizer'),
    );
  }
}

// Класс компонент которое может хранит в себе состояние перемен
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // перемення которое хранит рандомное число

  void _incrementCounter() {
    /// Даёт рандомное число от одного до 10000
    _counter = Random().nextInt(10000) + 1;
    setState(() {
      // функция которое изменяет состояние пременной при каждом клике
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your random number',
              style: TextStyle(fontSize: 25, color: Colors.blue[200]),
            ),
            Text('$_counter',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.amber[400])),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Colors.deepPurple[300]),
                ),
                onPressed: _incrementCounter,
                child: const Text(
                  "Get random",
                  style: TextStyle(color: Colors.black87),
                ))
          ],
        ),
      ),
    );
  }
}
