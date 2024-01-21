// ignore_for_file: non_constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/DangKy.dart';
import 'package:giaodien/DatabaseManager.dart';
import 'package:giaodien/TrangChu.dart';
import 'package:giaodien/login_bloc.dart';
import 'package:giaodien/recover_pass.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DangNhap());
}

class DangNhap extends StatelessWidget {
  const DangNhap({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In',
      home: MyHomePage(
        title: 'Sign In',
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
  LoginBloc bloc = LoginBloc();
  bool _showPass = false;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  List dataList = [];

  fetchDatabaseList() async {
    dynamic result = await DatabaseManager().getUserData();
    if (result == null) {
      print("unable");
    } else {
      setState(() {
        dataList = result;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/background.jpg",
            ),
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              trang(355, 300, 570),
              trang(3, 300, 570),
              Container(
                width: 300,
                height: 600,
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    const Text(
                      'Đăng Nhập',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Điền đầy đủ thông tin đăng nhập của bạn.',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: StreamBuilder(
                        stream: bloc.userStream,
                        builder: (context, snapshot) => TextField(
                          controller: _userController,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Tên đăng nhập",
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: const TextStyle(
                                  color: Color(0xff888888), fontSize: 15)),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: <Widget>[
                            StreamBuilder(
                              stream: bloc.passStream,
                              builder: (context, snapshot) => TextField(
                                controller: _passController,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black),
                                obscureText: !_showPass,
                                decoration: InputDecoration(
                                    labelText: "Mật khẩu",
                                    errorText: snapshot.hasError
                                        ? snapshot.error.toString()
                                        : null,
                                    labelStyle: const TextStyle(
                                        color: Color(0xff888888),
                                        fontSize: 15)),
                              ),
                            ),
                            GestureDetector(
                              onTap: show_hide,
                              child: Text(
                                _showPass ? "ẨN" : "HIỆN",
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: 'Chưa có tài khoản? ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: 'Đăng ký',
                            style: const TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DangKy()),
                                );
                              }),
                      ]),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: 'Quên mật khẩu? ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: 'Khôi phục',
                            style: const TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const KhoiPhucPass()),
                                );
                              }),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(55, 40, 0, 0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: FloatingActionButton.extended(
                                label: const Text(
                                  'Đăng nhập',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.black,
                                onPressed: () {
                                  Login(dataList);
                                }),
                          ),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(10, 40, 0, 0)),
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: FloatingActionButton.extended(
                              label: const Text(
                                'Chơi ngay',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.black,
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TrangChu(
                                      username: _userController.text,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void show_hide() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  Widget trang(int toado, double rong, double dai) {
    return Transform.rotate(
      angle: toado * 3.14 / 180,
      child: Container(
        width: rong,
        height: dai,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
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
    );
  }

  void Login(List<dynamic> l) {
    if (bloc.isValidInput(_userController.text, _passController.text) &&
        bloc.isValidAccount(_userController.text, _passController.text, l)) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TrangChu(
                  username: _userController.text,
                )),
      );
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text(
                  "Đăng nhập không thành công",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                content: Text("Mật khẩu hoặc tài khoản không đúng",
                    textAlign: TextAlign.center),
              ),
          barrierDismissible: true);
    }
  }
}
