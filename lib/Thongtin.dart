import 'package:flutter/material.dart';
import 'package:giaodien/BangXepHang.dart';
import 'package:giaodien/LichSuDau.dart';

void main() {
  runApp(const ThongTin());
}

class ThongTin extends StatelessWidget {
  const ThongTin({super.key});

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
                width: 1400,
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
                              builder: (context) => const BangXepHang()),
                        );
                      },
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                    Center(
                      child: Text(
                        'Thông Tin',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    child: Image(image: AssetImage('images/user.png')),
                    width: 70,
                    height: 70,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                  Text(
                    'Username',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(170, 0, 0, 0)),
                  Icon(
                    Icons.settings,
                    size: 30,
                  ),
                ],
              ),
              Text('Đã tham gia vào tháng Năm 2022'),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Mô tả thông tin',
                  icon: Icon(Icons.description),
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(70, 0, 0, 0)),
                  SizedBox(
                    width: 150,
                    height: 30,
                    child: DecoratedBox(
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
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.history,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LichSuDau()),
                            );
                          },
                          label: Text(
                            'Lịch Sử Đấu',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            onSurface: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                        )),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                  SizedBox(
                    width: 60,
                    height: 30,
                    child: DecoratedBox(
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
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const LichSuDau()),
                            // );
                          },
                          label: Text(''),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            onSurface: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                        )),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              Divider(
                color: Colors.black,
              ),
              Text('Thống kê',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image(
                        image: AssetImage('images/flame.png'),
                        width: 20,
                        height: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      label: Text.rich(
                        TextSpan(
                          text: '0\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Chuỗi Thắng',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(40, 0, 0, 0)),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image(
                        image: AssetImage('images/trophy.png'),
                        width: 20,
                        height: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      label: Text.rich(
                        TextSpan(
                          text: '0\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Trận Thắng',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image(
                        image: AssetImage('images/silver-medal.png'),
                        width: 20,
                        height: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      label: Text.rich(
                        TextSpan(
                          text: 'Bạc\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Hiện Tại',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(40, 0, 0, 0)),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image(
                        image: AssetImage('images/gold-medal.png'),
                        width: 20,
                        height: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      label: Text.rich(
                        TextSpan(
                          text: 'Vàng\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Cao Nhất',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          )),
    );
  }
}
