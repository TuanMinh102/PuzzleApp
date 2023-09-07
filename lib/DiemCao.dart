// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:giaodien/TrangChu.dart';
// import 'package:giaodien/PhongDau.dart';
// import 'package:giaodien/Thongtin.dart';

// import 'NapCredit.dart';
// import 'package:stroke_text/stroke_text.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(DiemCao());
// }

class DiemCao extends StatefulWidget {
  final String username;
  const DiemCao({super.key, required this.username});

  @override
  State<DiemCao> createState() => _DiemCaoState();
}

class _DiemCaoState extends State<DiemCao> {
  List dataList = [];
  List<String> arr = ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0'];
  @override
  fetchDatabaseList() async {
    // dynamic result2 = await DatabaseManager().getData();
    final result2 = await FirebaseFirestore.instance
        .collection('highscore')
        .where('username', isEqualTo: widget.username)
        .get();
    if (result2 == null) {
      print("unable");
    } else {
      setState(() {
        dataList = result2.docs.map((e) => e.data()).toList();

        for (int i = 1; i <= 10; i++)
          arr[i - 1] = dataList[0]['ai$i'].toString();
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrangChu(
                                    username: widget.username,
                                  )),
                        );
                      },
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                    Center(
                      child: Text(
                        'Điểm Cao',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Text("Account: " + widget.username),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Column(
                    children: [
                      Text(
                        'Level',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      for (int i = 1; i <= 10; i++) Text('Ải $i'),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left: 150)),
                  Column(
                    children: [
                      Text(
                        'Điểm',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      for (int i = 0; i < arr.length; i++)
                        Text(arr[i].toString()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
