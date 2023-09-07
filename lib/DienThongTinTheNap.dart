import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const DienThongTinTheNap());
}

class DienThongTinTheNap extends StatelessWidget {
  const DienThongTinTheNap({super.key});

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
  int? num = 1;
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
          child: Column(
            children: [
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const DoiKhang()),
                        // );
                      },
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                    Center(
                      child: Text(
                        'Chọn Loại Thẻ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 100)),
              Container(
                width: 350,
                height: 300,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 4),
                          child: Container(
                            width: 3,
                            height: 20,
                            color: Colors.orange,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 3)),
                        Text(
                          'Chọn loại thẻ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: num,
                          onChanged: (value) {
                            setState(() {
                              num = value;
                            });
                          },
                        ),
                        Image(
                          image: AssetImage('images/thegosu.png'),
                          width: 60,
                          height: 60,
                        ),
                        Radio(
                          value: 2,
                          groupValue: num,
                          onChanged: (value) {
                            setState(() {
                              num = value;
                            });
                          },
                        ),
                        Image(
                          image: AssetImage('images/thegate.png'),
                          width: 60,
                          height: 60,
                        ),
                        Radio(
                          value: 3,
                          groupValue: num,
                          onChanged: (value) {
                            setState(() {
                              num = value;
                            });
                          },
                        ),
                        Image(
                          image: AssetImage('images/thevt.png'),
                          width: 60,
                          height: 60,
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                'Mua thẻ gosu và các thẻ game khác thử VTCPAY ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 11)),
                        TextSpan(
                            text: 'tại đây',
                            style: TextStyle(color: Colors.blue, fontSize: 11),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ]),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    SizedBox(
                      height: 35,
                      child: TextFormField(
                        autofocus: false,
                        obscureText: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: 'Mã ID',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.fromLTRB(8, 10, 10, 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0))),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    SizedBox(
                      height: 35,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: 'Mã Thẻ',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.fromLTRB(8, 10, 10, 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0))),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 35,
                          width: 160,
                          child: TextFormField(
                            autofocus: false,
                            obscureText: false,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: 'Mã xác nhận',
                                hintStyle: TextStyle(color: Colors.black),
                                contentPadding:
                                    EdgeInsets.fromLTRB(8, 10, 10, 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0))),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'Random number',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 15)),
                        Container(
                          width: 160,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            onPressed: () {},
                            child: Text('Nạp'),
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            onPressed: () {},
                            child: Text('Nhập Lại'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
