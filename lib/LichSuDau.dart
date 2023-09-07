import 'package:flutter/material.dart';

import 'package:stroke_text/stroke_text.dart';

import 'Thongtin.dart';

void main() {
  runApp(const LichSuDau());
}

class LichSuDau extends StatelessWidget {
  const LichSuDau({super.key});

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
              width: 1080,
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      size: 40,
                    ),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThongTin()),
                      );
                    },
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                  Center(
                    child: Text(
                      'Lịch Sử Đấu',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Container(
              width: 340,
              height: 550,
              color: Colors.white.withOpacity(0.5),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Container(
                    width: 300,
                    height: 40,
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
                      color: Colors.white.withOpacity(0.77),
                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Image(
                          image: AssetImage('images/user.png'),
                          width: 30,
                          height: 30,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 1,
                          color: Colors.black,
                          height: 30,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        StrokeText(
                          text: "Chiến Thắng",
                          textStyle:
                              TextStyle(fontSize: 15, color: Colors.yellow),
                          strokeColor: Colors.black,
                          strokeWidth: 1.5,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 1,
                          color: Colors.black,
                          height: 30,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          'Score:100',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 1,
                          color: Colors.black,
                          height: 30,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          'Đấu Đối Kháng\n' + '   3/11/2022',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Container(
                    width: 300,
                    height: 40,
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
                      color: Colors.white.withOpacity(0.77),
                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Image(
                          image: AssetImage('images/user.png'),
                          width: 30,
                          height: 30,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 1,
                          color: Colors.black,
                          height: 30,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        StrokeText(
                          text: "Thất Bại",
                          textStyle: TextStyle(fontSize: 15, color: Colors.red),
                          strokeColor: Colors.black,
                          strokeWidth: 1.5,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 1,
                          color: Colors.black,
                          height: 30,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          'Score:80',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 1,
                          color: Colors.black,
                          height: 30,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          'Đấu Đối Kháng\n' + '   2/10/2022',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Container(
                    width: 300,
                    height: 40,
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
                      color: Colors.white.withOpacity(0.77),
                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Image(
                          image: AssetImage('images/user.png'),
                          width: 30,
                          height: 30,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 1,
                          color: Colors.black,
                          height: 30,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        StrokeText(
                          text: "Chiến Thắng",
                          textStyle:
                              TextStyle(fontSize: 15, color: Colors.yellow),
                          strokeColor: Colors.black,
                          strokeWidth: 1.5,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 1,
                          color: Colors.black,
                          height: 30,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          'Score:120',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 1,
                          color: Colors.black,
                          height: 30,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          'Đấu Đối Kháng\n' + '   12/8/2022',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
