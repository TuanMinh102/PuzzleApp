// import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:giaodien/DatabaseManager.dart';
// import 'package:giaodien/TrangChu.dart';
// import 'dart:async';
import 'package:giaodien/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DangKy());
}

class DangKy extends StatelessWidget {
  const DangKy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
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
  AuthBloc authBloc = new AuthBloc();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _confirmController = new TextEditingController();
  List dataList = [];
  @override
  // void dispose() {
  //   authBloc.dispose();
  //   super.dispose();
  // }

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

  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 1920,
      width: 1080,
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
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Text(
                      'Sign Up',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                    Text(
                      'Click on each box below to enter your information.',
                      style: TextStyle(fontSize: 10),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: StreamBuilder(
                        stream: authBloc.nameStream,
                        builder: (context, snapshot) => TextField(
                          controller: _nameController,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Username",
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: TextStyle(
                                  color: Color(0xff888888), fontSize: 15)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: StreamBuilder(
                        stream: authBloc.emailStream,
                        builder: (context, snapshot) => TextField(
                          controller: _emailController,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Email or phone number",
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: TextStyle(
                                  color: Color(0xff888888), fontSize: 15)),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: <Widget>[
                            StreamBuilder(
                              stream: authBloc.passStream,
                              builder: (context, snapshot) => TextField(
                                controller: _passController,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                obscureText: !_showPass,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    errorText: snapshot.hasError
                                        ? snapshot.error.toString()
                                        : null,
                                    labelStyle: TextStyle(
                                        color: Color(0xff888888),
                                        fontSize: 15)),
                              ),
                            ),
                            GestureDetector(
                              onTap: show_hide,
                              child: Text(
                                _showPass ? "HIDE" : "SHOW",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: StreamBuilder(
                        stream: authBloc.confirmStream,
                        builder: (context, snapshot) => TextField(
                          controller: _confirmController,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          obscureText: !_showPass,
                          decoration: InputDecoration(
                              labelText: "Confirm Password",
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: TextStyle(
                                  color: Color(0xff888888), fontSize: 15)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: FloatingActionButton.extended(
                        label: Text(
                          'Click to confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.black,
                        onPressed: () {
                          SignUp(dataList);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void show_hide() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void SignUp(List<dynamic> l) {
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

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DangNhap()),
      );
    }
  }
}
