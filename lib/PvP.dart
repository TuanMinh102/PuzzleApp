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
  int dapAnA = 1;
  int dapAnB = 2;
  int dapAnC = 3;
  int dapAnD = 4;

  String docid = 'null';
  static int maxSeconds = 100;
  int seconds = maxSeconds;
  Timer? timer;
  int updated = 0;

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
    getdocumentid();
    countDown();
  }

  void countDown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        setState(() {
          timer.cancel();
        });
      }
    });
  }

  void check(int value) async {
    if (value == ListItem.lst[randomid].resultID) {
      dialog('Chính xác', Color.fromARGB(255, 0, 243, 150),
          'images/check-mark.png', 'Bạn được thêm 5 điểm');
      setState(() {
        score += 5;
      });
    } else {
      dialog('Sai rồi', Colors.red, 'images/cross.png',
          'Rất tiếc bạn đã trả lời sai :(');
    }

    randomID();
    setState(() {
      number++;
    });
  }

  Future<void> delay(int millis) async {
    await Future.delayed(Duration(milliseconds: millis));
  }

  void upDate(int time, var yourdata, int score) {
    final room = FirebaseFirestore.instance.collection('room_list').doc(docid);
    if (yourdata['host'] == widget.username) {
      room.update(
          {'score_host': (score + time).toString(), 'host_playing': 'false'});
    } else if (yourdata['competitor'] == widget.username) {
      room.update({
        'score_competitor': (score + time).toString(),
        'competitor_playing': 'false'
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('room_list')
              .doc(docid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('');
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Text('');
            } else {
              var yourData = snapshot.data!.data() as Map<String, dynamic>?;
              if (yourData != null) {
                if (number == 11 && seconds > 0 && updated != 1) {
                  updated = 1;
                  upDate(seconds, yourData, score);
                  return loading();
                } else if (seconds == 0 && updated != 1) {
                  updated = 1;
                  upDate(seconds, yourData, score);
                  return ResultPvP(
                      username: widget.username, idRoom: widget.idRoom);
                } else if (yourData['host_playing'] == 'false' &&
                    yourData['competitor_playing'] == 'false') {
                  return ResultPvP(
                      username: widget.username, idRoom: widget.idRoom);
                } else if ((yourData['host_playing'] == 'false' &&
                        widget.username == yourData['host']) ||
                    (yourData['competitor_playing'] == 'false' &&
                        widget.username != yourData['host'])) {
                  return loading();
                } else if (number < 11) {
                  return container(yourData);
                } else {
                  return loading();
                }
              } else {
                return const Text('');
              }
            }
          }),
    );
  }

  Widget container(var youData) {
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
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoiKhang(
                                username: widget.username,
                              )),
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                const Center(
                  child: Text(
                    'PvP',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
              Text(
                'Score:$score',
                style: const TextStyle(fontWeight: FontWeight.bold),
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
                  Row(children: [
                    const Padding(padding: EdgeInsets.only(left: 70)),
                    const Image(
                      image: AssetImage('images/hourglass.png'),
                      width: 30,
                      height: 30,
                    ),
                    Text(
                      '$seconds',
                      style: const TextStyle(fontSize: 20),
                    )
                  ]),
                ],
              ),
            ],
          ),
          Container(
            width: 1000,
            height: 350,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/board.png'),
            )),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 70)),
                Text('Số câu $number/10',
                    style: const TextStyle(color: Colors.white)),
                const Padding(padding: EdgeInsets.only(top: 5)),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Text(ListItem.lst[randomid].question.toString(),
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center),
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
                    check(dapAnA);
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
                    check(dapAnB);
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
                    check(dapAnC);
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
                  check(dapAnD);
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
        mainAxisAlignment: MainAxisAlignment.center,
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

  //thong bao dap an
  void dialog(String thongbao, Color colors, String img, String noidung) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Row(
                children: [
                  Text(
                    thongbao,
                    style: TextStyle(color: colors),
                  ),
                  Image(
                    image: AssetImage(img),
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
              content: Text(noidung),
            ),
        barrierDismissible: true);
  }
}
