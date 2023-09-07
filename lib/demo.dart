import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/DangKy.dart';
import 'package:giaodien/DatabaseManager.dart';
import 'package:giaodien/TrangChu.dart';
import 'package:giaodien/login_bloc.dart';
import 'package:giaodien/recover_pass.dart';

void main() {
  runApp(DangNhap());
}

class DangNhap extends StatelessWidget {
  const DangNhap({super.key});

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
  bool a = false;
  String? b;
  @override
  void initState() {
    setState(() {
      a ? b = 'asd' : b = 'gsdg';
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(body: Text('$b'));
  }
}
