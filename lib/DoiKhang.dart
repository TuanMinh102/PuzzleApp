import 'dart:math';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/BangXepHang.dart';
import 'package:giaodien/PhongDau.dart';
import 'package:giaodien/ThamGiaPhong.dart';
import 'package:giaodien/TrangChu.dart';
import 'NapCredit.dart';

class DoiKhang extends StatefulWidget {
  final String username;
  const DoiKhang({super.key, required this.username});

  @override
  State<DoiKhang> createState() => _DoiKhangState();
}

class _DoiKhangState extends State<DoiKhang> {
  List dataList = [];
  int randomid = 1;

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

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    DateTime currentDate = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String date = formatter.format(currentDate);
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
          ),
        ),
        child: Column(children: [
          Container(
            width: screenSize.width,
            height: 60,
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    size: 40,
                  ),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrangChu(
                                username: widget.username,
                              )),
                    );
                  },
                ),
                const Expanded(
                  child: Text(
                    'Chơi Đối Kháng',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 160,
                height: 35,
                child: DecoratedBox(
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
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ThamGiaPhong(
                                    username: widget.username,
                                  )),
                        );
                      },
                      child: Text(
                        'Tham gia phòng',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onSurface: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                    )),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(10, 70, 10, 10)),
              SizedBox(
                width: 150,
                height: 35,
                child: DecoratedBox(
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
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        randomID(dataList);
                        Map<String, String> datatosave = {
                          'id': randomid.toString(),
                          'players': '1',
                          'host': widget.username,
                          'competitor': '',
                          'score_host': '0',
                          'score_competitor': '0',
                          'start': '0',
                          'host_playing': 'true',
                          'competitor_playing': 'true',
                          'finish': 'false',
                          'winner': '',
                          'day': date
                        };
                        FirebaseFirestore.instance
                            .collection('room_list')
                            .add(datatosave);
                        //
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhongDau(
                                    username: widget.username,
                                    idRoom: randomid.toString(),
                                  )),
                        );
                      },
                      child: Text(
                        'Tạo Phòng',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onSurface: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                    )),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(10, 70, 10, 10)),
              SizedBox(
                width: 150,
                height: 35,
                child: DecoratedBox(
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
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NapCredit(
                                    username: widget.username,
                                  )),
                        );
                      },
                      child: Text(
                        'Nạp credit',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onSurface: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                    )),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(10, 70, 10, 10)),
              SizedBox(
                width: 150,
                height: 35,
                child: DecoratedBox(
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
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BangXepHang(username: widget.username),
                        ),
                      );
                    },
                    child: Text(
                      'Bảng xếp hạng',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  void randomID(List<dynamic> l) {
    var rng = Random();
    bool flag = true;
    while (true) {
      for (int i = 0; i < l.length; i++) {
        if (rng.toString() == l[i]['id']) {
          rng = Random();
          flag = false;
        }
      }
      if (flag == true) break;
    }
    setState(() {
      randomid = rng.nextInt(10000);
    });
  }
}
