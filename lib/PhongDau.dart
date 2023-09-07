import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/ChoiGame.dart';
import 'package:giaodien/DoiKhang.dart';
import 'package:giaodien/ThamGiaPhong.dart';

class PhongDau extends StatefulWidget {
  final String username;
  final String idRoom;

  const PhongDau({super.key, required this.username, required this.idRoom});

  @override
  State<PhongDau> createState() => _PhongDauState();
}

class _PhongDauState extends State<PhongDau> {
  List dataList = [];
  String docid = '';

  @override
  void start(String documentID) {
    final room =
        FirebaseFirestore.instance.collection('room_list').doc(documentID);
    room.update({'start': '1'});
  }

  void quitRoom(String documentID) {
    final room =
        FirebaseFirestore.instance.collection('room_list').doc(documentID);
    if (dataList[0]['host'] == widget.username &&
        dataList[0]['players'] == '1') {
      room.delete();
    } else if (dataList[0]['host'] == widget.username &&
        dataList[0]['players'] == '2') {
      room.update({
        'host': dataList[0]['competitor'],
        'players': '1',
        'competitor': ''
      });
    } else if (dataList[0]['competitor'] != dataList[0]['host'] &&
        dataList[0]['competitor'] != '') {
      room.update({'competitor': '', 'players': '1'});
    }
  }

  Stream<String> reload() async* {
    while (true) {
      final result2 = await FirebaseFirestore.instance
          .collection('room_list')
          .where('id', isEqualTo: widget.idRoom)
          .get();
      setState(() {
        dataList = result2.docs.map((e) => e.data()).toList();
      });
      yield dataList[0]['competitor'].toString();
      await Future.delayed(Duration(seconds: 1));
    }
  }

  getdocumentid() async {
    final roomref = FirebaseFirestore.instance
        .collection('room_list')
        .where('id', isEqualTo: widget.idRoom)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        setState(() {
          docid = doc.id;
        });
      });
    });
  }

  fetchDatabaseList() async {
    final result2 = await FirebaseFirestore.instance
        .collection('room_list')
        .where('id', isEqualTo: widget.idRoom)
        .get();
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
    reload();
    getdocumentid();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<String>(
          initialData: dataList[0]['compotitor'],
          stream: reload(),
          builder: (context, snapshot) {
            if (dataList[0]['start'] == '1') {
              return ThamGiaPhong(username: widget.username);
            }
            return Container(
              width: 1080,
              height: 1920,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/background.jpg"),
                ),
              ),
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
                          quitRoom(docid);
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
                          'Phòng Đấu',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'ID:' + widget.idRoom,
                  style: TextStyle(color: Colors.red),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Row(children: [
                  Padding(padding: EdgeInsets.only(left: 80)),
                  Container(
                    child: Column(children: [
                      Image(
                        image: AssetImage('images/crown.png'),
                        width: 30,
                        height: 30,
                      ),
                      Image(
                        image: AssetImage('images/user.png'),
                        width: 55,
                        height: 55,
                      ),
                      Text(dataList[0]['host']),
                    ]),
                  ),
                  Padding(padding: EdgeInsets.only(left: 30)),
                  Image(
                    image: AssetImage('images/vs.png'),
                    width: 55,
                    height: 55,
                  ),
                  Padding(padding: EdgeInsets.only(left: 30)),
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20)),
                      if (dataList[0]['competitor'] == '')
                        Container(
                          width: 55,
                          height: 55,
                          color: Colors.white,
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {},
                          ),
                        )
                      else
                        Image(
                          image: AssetImage('images/user.png'),
                          width: 55,
                          height: 55,
                        ),
                      Text(dataList[0]['competitor']),
                    ],
                  ),
                ]),
                Padding(padding: EdgeInsets.only(top: 70)),
                if (dataList[0]['players'] == '2' &&
                    dataList[0]['host'] == widget.username)
                  ElevatedButton.icon(
                    onPressed: () {
                      start(docid);
                    },
                    icon: Image(
                      image: AssetImage('images/boxing-gloves.png'),
                      width: 35,
                      height: 35,
                    ),
                    label: Text('Bắt Đầu'),
                  ),
              ]),
            );
          }),
    );
  }
}
