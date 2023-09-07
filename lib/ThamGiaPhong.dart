import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/DoiKhang.dart';
import 'package:giaodien/PhongDau.dart';
import 'NapCredit.dart';
import 'package:stroke_text/stroke_text.dart';

class ThamGiaPhong extends StatefulWidget {
  final String username;
  const ThamGiaPhong({super.key, required this.username});

  @override
  State<ThamGiaPhong> createState() => _ThamGiaPhongState();
}

class _ThamGiaPhongState extends State<ThamGiaPhong> {
  List dataList = [];
  String docid = '';
  @override
  void join(int index) {
    if (dataList[index]['players'] == '2') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Row(
                  children: [
                    Text(
                      'Tham gia that bai',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                content: Text("Phong da du nguoi"),
              ),
          barrierDismissible: true);
    } else {
      final id = FirebaseFirestore.instance
          .collection('room_list')
          .where('id', isEqualTo: dataList[index]['id'])
          .get()
          .then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((DocumentSnapshot doc) {
          setState(() {
            docid = doc.id;
          });
        });
      });
      final room =
          FirebaseFirestore.instance.collection('room_list').doc(docid);
      room.update({'competitor': widget.username, 'players': '2'});
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhongDau(
            username: widget.username,
            idRoom: dataList[index]['id'],
          ),
        ),
      );
    }
  }

  fetchDatabaseList() async {
    final result2 =
        await FirebaseFirestore.instance.collection('room_list').get();
    if (result2 == null) {
      print("unable");
    } else {
      setState(() {
        dataList = result2.docs.map((e) => e.data()).toList();
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
                            builder: (context) => DoiKhang(
                                  username: widget.username,
                                )),
                      );
                    },
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                  Center(
                    child: Text(
                      'Tham Gia Phòng',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 160,
              height: 20,
              child: TextField(
                  // controller: username,
                  decoration: InputDecoration(
                labelText: "Nhập mã phòng",
                icon: Icon(Icons.search), //icon at head of input
              )),
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
                  for (int i = 0; i < dataList.length; i++)
                    Container(
                      width: 310,
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
                          Text(
                            'Id:' + dataList[i]['id'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Container(
                            width: 1,
                            color: Colors.black,
                            height: 30,
                          ),
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Text(
                            'Host:' + dataList[i]['host'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Container(
                            width: 1,
                            color: Colors.black,
                            height: 30,
                          ),
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Text(
                            'Players:' + dataList[i]['players'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Container(
                            width: 1,
                            color: Colors.black,
                            height: 30,
                          ),
                          IconButton(
                            icon: Icon(Icons.login),
                            onPressed: () {
                              join(i);
                            },
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
