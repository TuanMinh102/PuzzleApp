import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/DoiKhang.dart';
import 'package:giaodien/list-question.dart';
import 'package:giaodien/ResultPvP.dart';
// void main() {
//   runApp(const PvP());
// }

class PvP extends StatefulWidget {
  final String username;
  final String idRoom;

  const PvP({super.key, required this.username, required this.idRoom});

  @override
  State<PvP> createState() => _PvPState();
}

class _PvPState extends State<PvP> {
  List<ListItem> lst = List<ListItem>.filled(
      0,
      ListItem(
          question: '',
          answer1: '',
          answer2: '',
          answer3: '',
          answer4: '',
          resultID: 0),
      growable: true);
  int randomid = Random().nextInt(100);
  int number = 1;
  int score = 0;
  int button1 = 1;
  int button2 = 2;
  int button3 = 3;
  int button4 = 4;

  List dataList2 = [];
  String docid = '';
  static int maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;
  int remainingTime = 0;
  int tmp = 0;
  bool timeup = false;

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

  @override
  void initState() {
    super.initState();
    startTimer();
    getdocumentid();
    countDown();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timeup = true;
      }
    });
  }

  Stream<int> countDown() async* {
    while (true) {
      final result2 = await FirebaseFirestore.instance
          .collection('room_list')
          .where('id', isEqualTo: widget.idRoom)
          .get();
      if (result2 == null) {
        print("unable");
      } else {
        setState(() {
          dataList2 = result2.docs.map((e) => e.data()).toList();
        });
      }
      yield seconds;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  void check(int value) async {
    if (value == ListItem.lst[randomid].resultID) {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Row(
                  children: [
                    Text(
                      'Chính Xác',
                      style: TextStyle(color: Color.fromARGB(255, 0, 243, 150)),
                    ),
                    Image(
                      image: AssetImage('images/check-mark.png'),
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
                content: Text("Bạn được thêm 5 điểm"),
              ),
          barrierDismissible: true);
      score += 5;
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Row(
                  children: [
                    Text(
                      'Sai Rồi',
                      style: TextStyle(color: Colors.red),
                    ),
                    Image(
                      image: AssetImage('images/cross.png'),
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
                content: Text("Rất tiếc bạn đã trả lời sai :("),
              ),
          barrierDismissible: true);
    }
    randomID();
    number++;

    //await delay(1000);
  }

  Future<void> delay(int millis) async {
    await Future.delayed(Duration(milliseconds: millis));
  }

  void upDate(int time) {
    // timer?.cancel();
    final room = FirebaseFirestore.instance.collection('room_list').doc(docid);
    if (dataList2[0]['host'] == widget.username) {
      room.update(
          {'score_host': (score + time).toString(), 'host_playing': 'false'});
    } else {
      room.update({
        'score_competitor': (score + time).toString(),
        'competitor_playing': 'false'
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
          initialData: seconds,
          stream: countDown(),
          builder: (context, snapshot) {
            if (number == 11 && seconds > 0 && tmp != 1) {
              tmp = 1;
              upDate(seconds);
              return loading();
            } else if (dataList2[0]['host_playing'] == 'false' &&
                dataList2[0]['competitor_playing'] == 'false') {
              return ResultPvP(
                  username: widget.username, idRoom: widget.idRoom);
            } else if (timeup == true && tmp != 1) {
              tmp = 1;
              upDate(seconds);
              return ResultPvP(
                  username: widget.username, idRoom: widget.idRoom);
            } else if ((dataList2[0]['host_playing'] == 'false' &&
                    widget.username == dataList2[0]['host']) ||
                (dataList2[0]['competitor_playing'] == 'false' &&
                    widget.username != dataList2[0]['host'])) {
              return loading();
            } else if (number < 11) {
              return Container(
                width: 1080,
                height: 1920,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
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
                            icon: const Icon(
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
                          const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                          const Center(
                            child: Text(
                              'PvP',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                        Text(
                          'Score:$score',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 100)),
                            const Image(
                              image: AssetImage('images/light-bulb.png'),
                              width: 30,
                              height: 30,
                            ),
                            const Text(
                              'x2',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              '$seconds',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('images/table.png'),
                      )),
                      child: Column(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 70)),
                          Text('Số câu $number/10',
                              style: TextStyle(color: Colors.white)),
                          Padding(padding: EdgeInsets.only(top: 40)),
                          Text(ListItem.lst[randomid].question.toString(),
                              style: TextStyle(color: Colors.white)),
                          const Padding(
                            padding: EdgeInsets.only(top: 60, right: 260),
                            child: Image(
                              image: AssetImage('images/koala.png'),
                              width: 45,
                              height: 45,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
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
                              check(button1);
                            },
                            child: Text(
                              ListItem.lst[randomid].answer1.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              onSurface: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                          )),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 12)),
                    SizedBox(
                      width: 200,
                      height: 50,
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
                              check(button2);
                            },
                            child: Text(
                              ListItem.lst[randomid].answer2.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              onSurface: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                          )),
                    ),
                    Padding(padding: EdgeInsets.only(top: 12)),
                    SizedBox(
                      width: 200,
                      height: 50,
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
                              check(button3);
                            },
                            child: Text(
                              ListItem.lst[randomid].answer3.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              onSurface: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                          )),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 12)),
                    SizedBox(
                      width: 200,
                      height: 50,
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
                            check(button4);
                          },
                          child: Text(
                            ListItem.lst[randomid].answer4.toString(),
                            style: TextStyle(color: Colors.black),
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
              );
            } else {
              return loading();
            }
          }),
    );
  }

  void randomID() {
    var rng = Random();
    bool flag = true;
    while (true) {
      for (int i = 0; i < lst.length; i++) {
        if (rng.toString() == randomid.toString()) {
          rng = Random();
          flag = false;
        }
      }
      if (flag == true) break;
    }

    setState(() {
      randomid = rng.nextInt(100);
    });
  }

  Widget loading() {
    return const Center(
      child: Column(
        children: [
          CircularProgressIndicator(
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
          Text(
            'Đang chờ đối thủ...',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
