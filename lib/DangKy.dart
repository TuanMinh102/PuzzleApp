import 'package:flutter/material.dart';
import 'package:giaodien/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:giaodien/DatabaseManager.dart';

import 'package:giaodien/auth_bloc.dart';

class DangKy extends StatelessWidget {
  const DangKy({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sign Up',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'Sign Up',
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
  bool _showPass = false;
  AuthBloc authBloc = AuthBloc();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white.withOpacity(0),
                ),
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    const Text(
                      'Đăng ký',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    ),
                    const Text(
                      'Điền đầy đủ thông tin đăng ký của bạn.',
                      style: TextStyle(fontSize: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: StreamBuilder(
                        stream: authBloc.nameStream,
                        builder: (context, snapshot) => TextField(
                          controller: _nameController,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Tên đăng nhập",
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelStyle: const TextStyle(
                                color: Color(0xff888888), fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: StreamBuilder(
                        stream: authBloc.emailStream,
                        builder: (context, snapshot) => TextField(
                          controller: _emailController,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Email",
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelStyle: const TextStyle(
                                color: Color(0xff888888), fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: <Widget>[
                          StreamBuilder(
                            stream: authBloc.passStream,
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
                                    color: Color(0xff888888), fontSize: 15),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: showHide,
                            child: Text(
                              _showPass ? "ẨN" : "HIỆN",
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: StreamBuilder(
                        stream: authBloc.confirmStream,
                        builder: (context, snapshot) => TextField(
                          controller: _confirmController,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          obscureText: !_showPass,
                          decoration: InputDecoration(
                            labelText: "Xác nhận mật khẩu",
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelStyle: const TextStyle(
                                color: Color(0xff888888), fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 35, top: 10),
                          child: FloatingActionButton.extended(
                            label: const Text(
                              'Trở về',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.black,
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DangNhap()),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: FloatingActionButton.extended(
                            label: const Text(
                              'Bấm để đăng ký',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.black,
                            onPressed: () {
                              signUp(dataList);
                            },
                          ),
                        ),
                      ],
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

// Hien thi mat khau
  void showHide() {
    setState(() {
      _showPass = !_showPass;
    });
  }

//
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
          color: Colors.white.withOpacity(0.65),
        ),
      ),
    );
  }

//Kiem tra dang ky
  void signUp(List<dynamic> l) {
    if (authBloc.isValid(_nameController.text, _emailController.text,
        _passController.text, _confirmController.text, l)) {
      Map<String, String> datatosave = {
        'username': _nameController.text,
        'email': _emailController.text,
        'password': _passController.text
      };
      FirebaseFirestore.instance.collection('accounts_list').add(datatosave);
      Map<String, String> datatosave2 = {
        'username': _nameController.text,
        'ai1': '0',
        'ai2': '0',
        'ai3': '0',
        'ai4': '0',
        'ai5': '0',
        'ai6': '0',
        'ai7': '0',
        'ai8': '0',
        'ai9': '0',
        'ai10': '0',
      };
      FirebaseFirestore.instance.collection('highscore').add(datatosave2);
      Map<String, String> datatosave3 = {
        'username': _nameController.text,
        'Streak': '0',
        'Current_rank': 'iron',
        'Hightest_rank': 'iron',
        'Win': '0'
      };
      FirebaseFirestore.instance.collection('accounts_info').add(datatosave3);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DangNhap()),
      );
    }
  }
}
