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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
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
    return Scaffold(
      body: Container(
        width: 1920,
        height: 1080,
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
              Transform.rotate(
                angle: 355 * 3.14 / 180,
                child: Container(
                  width: 290,
                  height: 563,
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
              ),
              Transform.rotate(
                angle: 3 * 3.14 / 180,
                child: Container(
                  width: 300,
                  height: 600,
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
                    color: Colors.white.withOpacity(0.66),
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                        child: Text(
                          'Fill your information to sign in.',
                          style: TextStyle(color: Colors.black, fontSize: 10),
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
                                labelText: "Username",
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
                                      labelText: "Password",
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
                                  _showPass ? "HIDE" : "SHOW",
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
                            text: 'None of account? ',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                              text: 'Sign up',
                              style: const TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
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
                            text: 'Forget your password? ',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                              text: 'Recover',
                              style: const TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
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
                              width: 70,
                              height: 40,
                              child: FloatingActionButton.extended(
                                  label: const Text(
                                    'Sign in',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.black,
                                  onPressed: Login),
                            ),
                            const Padding(padding: EdgeInsets.all(20)),
                            SizedBox(
                              width: 75,
                              height: 40,
                              child: FloatingActionButton.extended(
                                label: const Text(
                                  'Start now',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.black,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TrangChu(
                                              username: _userController.text,
                                            )),
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

  void Login() {
    bool flag = false;
    for (int i = 0; i < dataList.length; i++) {
      if (dataList[i]['username'] == _userController.text &&
          dataList[i]['password'] == _passController.text) {
        flag = true;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TrangChu(
                    username: _userController.text,
                  )),
        );
        break;
      }
    }
    if (flag == false) {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Row(
                  children: [
                    Text(
                      'Đăng nhập không thành công',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                content: Text("Mật khẩu hoặc tài khoản không đúng"),
              ),
          barrierDismissible: true);
    }
  }
}
