// import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/ChoiGame.dart';

import 'package:giaodien/TrangChu.dart';

// void main() {
//   runApp(const ChoiDon());
// }

class ChoiDon extends StatefulWidget {
  final String username;
  const ChoiDon({super.key, required this.username});

  @override
  State<ChoiDon> createState() => _ChoiDonState();
}

class _ChoiDonState extends State<ChoiDon> {
  List dataList = [];
  List<String> arr = ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0'];

  fetchDatabaseList() async {
    // dynamic result = await DatabaseManager().getData();
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
        child: Column(
          children: [
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
                            builder: (context) => TrangChu(
                                  username: widget.username,
                                )),
                      );
                    },
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                  Center(
                    child: Text(
                      'Chơi Đơn',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Wrap(children: <Widget>[
              for (int i = 1; i <= 10; i++)
                if (i == 1)
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 20),
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoiGame(
                                      level: i,
                                      username: widget.username,
                                    )),
                          );
                        },
                        child: Text(
                          'Ải $i',
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                      ),
                    ),
                  )
                else if (i != 1 && OpenLV(i) == false)
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 20),
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                        ),
                        onPressed: () {},
                        icon: Image(
                          image: AssetImage('images/lock.png'),
                          width: 20,
                          height: 20,
                        ),
                        label: Text(
                          'Ải $i',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  )
                else if (i != 1 && OpenLV(i))
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 20),
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoiGame(
                                      level: i,
                                      username: widget.username,
                                    )),
                          );
                        },
                        child: Text(
                          'Ải $i',
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
            ]),
          ],
        ),
      ),
    );
  }

  int GetInitial(String string) {
    return int.parse(string);
  }

  bool OpenLV(int number) {
    if (GetInitial(arr[number - 2]) < 25) {
      return false;
    }
    return true;
  }
}
