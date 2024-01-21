import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/ChoiDon.dart';
import 'package:giaodien/KetThucGame.dart';
import 'package:giaodien/list-question.dart';

// void main() {
//   runApp(const ChoiGame());
// }

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
  int button1 = 1;
  int button2 = 2;
  int button3 = 3;
  int button4 = 4;
  List dataList = [];
  String docid = '';

  getdocumentid() async {
    final userref = FirebaseFirestore.instance
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
        Level();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
    getdocumentid();
  }

  void check(int value) async {
    if (value == ListItem.lst[index].resultID) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
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
      setState(() {
        score += 5;
      });
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
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
    await delay(2000);
    setState(() {
      index++;
      number++;
      if (index == 10 ||
          index == 20 ||
          index == 30 ||
          index == 40 ||
          index == 50 ||
          index == 60 ||
          index == 70 ||
          index == 80 ||
          index == 90 ||
          index == 100) {
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
                  )),
        );
      }
    });
  }

  Future<void> delay(int millis) async {
    await Future.delayed(Duration(milliseconds: millis));
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
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                  Center(
                    child: Text(
                      'Level' + widget.level.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                Text(
                  'Score:$score',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 110)),
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
                ),
              ],
            ),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/table.png'),
              )),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 70)),
                  Text('Số câu $number/10',
                      style: TextStyle(color: Colors.white)),
                  Padding(padding: EdgeInsets.only(top: 40)),
                  Text(ListItem.lst[index].question.toString(),
                      style: TextStyle(color: Colors.white)),
                  Padding(
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
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      check(button1);
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
                  )),
            ),
            Padding(padding: EdgeInsets.only(top: 12)),
            SizedBox(
              width: 200,
              height: 50,
              child: DecoratedBox(
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
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      check(button2);
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
            Padding(padding: EdgeInsets.only(top: 12)),
            SizedBox(
              width: 200,
              height: 50,
              child: DecoratedBox(
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
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      check(button3);
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
            Padding(padding: EdgeInsets.only(top: 12)),
            SizedBox(
              width: 200,
              height: 50,
              child: DecoratedBox(
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
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    check(button4);
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

  int GetInitial(String string) {
    return int.parse(string);
  }

  bool checkHighScore(String string, int score) {
    if (GetInitial(string) < score) {
      return true;
    }
    return false;
  }

  void Level() {
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
}
