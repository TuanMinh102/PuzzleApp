import 'package:flutter/material.dart';

void main() {
  runApp(const KhoiPhucPass());
}

class KhoiPhucPass extends StatelessWidget {
  const KhoiPhucPass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recover Password',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Recover Password',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 1080,
      height: 1920,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage(
            "images/background.jpg",
          ),
        ),
      ),
      child: Center(
        child: Stack(
          children: [
            Transform.rotate(
              angle: 355 * 3.14 / 180,
              child: Container(
                width: 290,
                height: 563,
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.grey,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.65),
                ),
              ),
            ),
            Transform.rotate(
              angle: 2 * 3.14 / 180,
              child: Container(
                width: 300,
                height: 600,
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.grey,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.77),
                ),
              ),
            ),
            Transform.rotate(
              angle: 0,
              child: Container(
                width: 300,
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white.withOpacity(0),
                ),
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                    Text('Recover Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                    Text(
                      'Fill your information to change.',
                      style: TextStyle(fontSize: 10),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.grey,
                              ],
                              stops: [
                                0.0,
                                1.0
                              ],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              tileMode: TileMode.repeated),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                              hintText: 'Email or Phone number',
                              hintStyle: TextStyle(color: Colors.black),
                              contentPadding:
                                  EdgeInsets.fromLTRB(8, 10, 10, 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.grey,
                              ],
                              stops: [
                                0.0,
                                1.0
                              ],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              tileMode: TileMode.repeated),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'New Password',
                              hintStyle: TextStyle(color: Colors.black),
                              contentPadding:
                                  EdgeInsets.fromLTRB(8, 10, 10, 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.grey,
                              ],
                              stops: [
                                0.0,
                                1.0
                              ],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              tileMode: TileMode.repeated),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(color: Colors.black),
                              contentPadding:
                                  EdgeInsets.fromLTRB(8, 10, 10, 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: FloatingActionButton.extended(
                        label: Text(
                          'Change',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.black,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
