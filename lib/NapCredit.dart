import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const NapCreadit());
}

class NapCreadit extends StatelessWidget {
  const NapCreadit({super.key});

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
  int item = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 1080,
      height: 1920,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("images/background.jpg"),
        ),
      ),
      child: Center(
        child: Column(children: [
          Container(
            width: 1400,
            height: 60,
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    size: 40,
                  ),
                  color: Colors.black,
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const DoiKhang()),
                    // );
                  },
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 120, 0)),
                Center(
                  child: Text(
                    'Nạp Credit',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 250, top: 10),
            width: 100,
            height: 40,
            color: Colors.white,
            child: Row(
              children: [
                Image(
                  image: AssetImage('images/light-bulb.png'),
                  width: 70,
                  height: 30,
                ),
                Text(
                  '$item',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
          FloatingActionButton.extended(
            label: Text(
              '10 / 20.000 VNĐ',
            ),
            backgroundColor: Colors.grey,
            icon: Image(
              image: AssetImage('images/light-bulb.png'),
              width: 30,
              height: 30,
            ),
            onPressed: () {},
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
          FloatingActionButton.extended(
            label: Text('30 / 50.000 VNĐ'),
            backgroundColor: Colors.grey,
            icon: Image(
              image: AssetImage('images/light-bulb.png'),
              width: 30,
              height: 30,
            ),
            onPressed: () {},
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
          FloatingActionButton.extended(
            label: Text('65 / 100.000 VNĐ'),
            backgroundColor: Colors.grey,
            icon: Image(
              image: AssetImage('images/light-bulb.png'),
              width: 30,
              height: 30,
            ),
            onPressed: () {},
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
          FloatingActionButton.extended(
            label: Text('115 / 200.000 VNĐ'),
            backgroundColor: Colors.grey,
            icon: Image(
              image: AssetImage('images/light-bulb.png'),
              width: 30,
              height: 30,
            ),
            onPressed: () {},
          ),
        ]),
      ),
    ));
  }
}
