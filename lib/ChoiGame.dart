import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/ChoiDon.dart';
import 'package:giaodien/KetThucGame.dart';
import 'package:giaodien/list-question.dart';

class ChoiGame extends StatefulWidget {
  final int level;
  final String username;
  const ChoiGame({super.key, required this.level, required this.username});

  @override
  State<ChoiGame> createState() => _ChoiGameState();
}

class _ChoiGameState extends State<ChoiGame> {
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
  int index = 0;
  int number = 1;
  int score = 0;
  int A = 1;
  int B = 2;
  int C = 3;
  int D = 4;
  List dataList = [];
  String docid = '';

  getdocumentid() async {
    final userref = await FirebaseFirestore.instance
        .collection('highscore')
        .where('username', isEqualTo: widget.username)
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
        .collection('highscore')
        .where('username', isEqualTo: widget.username)
        .get();
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
    getdocumentid();
    level();
  }

  Future<void> delay(int millis) async {
    await Future.delayed(Duration(milliseconds: millis));
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
          ),
        ),
        child: Center(
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
                            builder: (context) => ChoiDon(
                                  username: widget.username,
                                )),
                      );
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Level ' + widget.level.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Score: $score',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 100)),
                    Image(
                      image: AssetImage('images/light-bulb.png'),
                      width: 30,
                      height: 30,
                    ),
                    Text(
                      'x2',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 400,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/table.png'),
                ),
              ),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 70)),
                  Text('Số câu $number/10',
                      style: const TextStyle(color: Colors.white)),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: Text(
                      ListItem.lst[index].question.toString(),
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
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
                    check(A);
                  },
                  child: Text(
                    ListItem.lst[index].answer1.toString(),
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
                      check(B);
                    },
                    child: Text(
                      ListItem.lst[index].answer2.toString(),
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
                      check(C);
                    },
                    child: Text(
                      ListItem.lst[index].answer3.toString(),
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
                    check(D);
                  },
                  child: Text(
                    ListItem.lst[index].answer4.toString(),
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
      ),
    );
  }

  int getInitial(String string) {
    return int.parse(string);
  }

  bool checkHighScore(String string, int score) {
    if (getInitial(string) < score) {
      return true;
    }
    return false;
  }

  void level() {
    setState(() {
      if (widget.level == 1) {
        index = 0;
      } else if (widget.level == 2) {
        index = 10;
      } else if (widget.level == 3) {
        index = 20;
      } else if (widget.level == 4) {
        index = 30;
      } else if (widget.level == 5) {
        index = 40;
      } else if (widget.level == 6) {
        index = 50;
      } else if (widget.level == 7) {
        index = 60;
      } else if (widget.level == 8) {
        index = 70;
      } else if (widget.level == 9) {
        index = 80;
      } else {
        index = 90;
      }
    });
  }

//kiem tra dap an
  void check(int value) async {
    if (value == ListItem.lst[index].resultID) {
      dialog('Chính xác', Color.fromARGB(255, 0, 243, 150),
          'images/check-mark.png', 'Bạn được thêm 5 điểm');
      setState(() {
        score += 5;
      });
    } else {
      dialog('Sai rồi', Colors.red, 'images/cross.png',
          'Rất tiếc bạn đã trả lời sai :(');
    }

    setState(() {
      index++;
      if (index < (widget.level * 10)) {
        number++;
      }
      if (index % 10 == 0) {
        int lv = widget.level;
        if (checkHighScore(dataList[0]['ai$lv'].toString(), score) == true) {
          final highscore =
              FirebaseFirestore.instance.collection('highscore').doc(docid);
          highscore.update({'ai$lv': score.toString()});
        }
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KetThucGame(
              score: score,
              level: widget.level,
              username: widget.username,
            ),
          ),
        );
      }
    });
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
