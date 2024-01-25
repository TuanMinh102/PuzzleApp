import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/ChoiGame.dart';
import 'package:giaodien/TrangChu.dart';

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
    final result2 = await FirebaseFirestore.instance
        .collection('highscore')
        .where('username', isEqualTo: widget.username)
        .get();
    if (result2 == null) {
      print("unable");
    } else {
      setState(() {
        dataList = result2.docs.map((e) => e.data()).toList();
        for (int i = 1; i <= 10; i++) {
          arr[i - 1] = dataList[0]['ai$i'].toString();
        }
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
        width: 1080,
        height: 1920,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
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
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                  const Center(
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
            Center(
              child: Wrap(spacing: 20, children: [
                for (int i = 1; i <= 10; i++)
                  if (i == 1)
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 60),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChoiGame(
                                  level: i,
                                  username: widget.username,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Ải $i',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          ),
                        ),
                      ),
                    )
                  else if (i != 1 && openLV(i) == false)
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 60),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: ((context) => const AlertDialog(
                                    title: Text('Thông Báo',
                                        style: TextStyle(color: Colors.red)),
                                    content:
                                        Text('Bạn cần vượt qua ải trước đó'),
                                  )),
                            );
                          },
                          icon: const Image(
                            image: AssetImage('images/lock.png'),
                            width: 20,
                            height: 20,
                          ),
                          label: Text(
                            'Ải $i',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    )
                  else if (i != 1 && openLV(i))
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 60),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
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
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          ),
                        ),
                      ),
                    ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  int getInitial(String string) {
    return int.parse(string);
  }

  bool openLV(int number) {
    if (getInitial(arr[number - 2]) < 25) {
      return false;
    }
    return true;
  }
}
