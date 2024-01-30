import 'package:flutter/material.dart';

import 'package:giaodien/Thongtin.dart';

import 'DoiKhang.dart';

class BangXepHang extends StatefulWidget {
  final String username;
  const BangXepHang({super.key, required this.username});

  @override
  State<BangXepHang> createState() => _BangXepHangState();
}

class _BangXepHangState extends State<BangXepHang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1080,
        height: 1920,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
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
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 40,
                    ),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DoiKhang(username: widget.username),
                        ),
                      );
                    },
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                  Center(
                    child: Text(
                      'Bảng Xếp Hạng',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Image(
              image: AssetImage('images/top.png'),
              width: 100,
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
            ),
            Container(
              width: 340,
              height: 450,
              color: Colors.white.withOpacity(0.5),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 20)),
                  new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ThongTin(username: widget.username),
                          ),
                        );
                      },
                      child: new Container(
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
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Image(
                              image: AssetImage('images/user.png'),
                              width: 30,
                              height: 30,
                            ),
                            Padding(padding: EdgeInsets.only(left: 20)),
                            Text(
                              'Player',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Padding(padding: EdgeInsets.only(left: 20)),
                            Image(image: AssetImage('images/gold-medal.png')),
                            Padding(padding: EdgeInsets.only(left: 20)),
                            Text(
                              "250",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      )),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ThongTin(username: widget.username),
                          ),
                        );
                      },
                      child: new Container(
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
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Image(
                              image: AssetImage('images/user.png'),
                              width: 30,
                              height: 30,
                            ),
                            Padding(padding: EdgeInsets.only(left: 20)),
                            Text(
                              'Player',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Padding(padding: EdgeInsets.only(left: 20)),
                            Image(image: AssetImage('images/silver-medal.png')),
                            Padding(padding: EdgeInsets.only(left: 20)),
                            Text(
                              "200",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
