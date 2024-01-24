import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const demo());
}

class demo extends StatelessWidget {
  const demo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer? timer;
  int seconds = 5;
  void countDown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }

  Widget build(BuildContext context) {
    if (seconds == 0)
      return Scaffold(
          body: Center(
        child: Text('time up'),
      ));
    else
      return Scaffold(
        body: Center(
          child: Text(seconds.toString()),
        ),
      );
  }
}
