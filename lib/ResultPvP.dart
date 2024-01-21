import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/TrangChu.dart';

// void main() {
//   runApp( ResultPvP());
// }

class ResultPvP extends StatefulWidget {
  final String username;
  final String idRoom;
  const ResultPvP({super.key, required this.username, required this.idRoom});
  @override
  State<ResultPvP> createState() => _ResultPvPState();
}

class _ResultPvPState extends State<ResultPvP> {
  List dataList = [];
  String docid = '';
  int host = 0;
  int competitor = 0;
  int max = 0;
  int min = 0;
  String win = '';
  String lost = '';
  bool flag = true;
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
      flag = false;
      print("unable");
    } else {
      setState(() {
        dataList = result2.docs.map((e) => e.data()).toList();
        host = getInitial(dataList[0]['score_host']);
        competitor = getInitial(dataList[0]['score_competitor']);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getdocumentid();
    fetchDatabaseList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1920,
        height: 1080,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/background.jpg",
            ),
          ),
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              // delRoom(),
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrangChu(
                    username: widget.username,
                  ),
                ),
              );
            },
            child: Container(
              width: 350,
              height: 500,
              color: Colors.grey.withOpacity(0.8),
              child: Center(
                child: Column(
                  children: [
                    if (winner() == true)
                      const Text(
                        'Chiến Thắng',
                        style: TextStyle(color: Colors.yellow, fontSize: 50),
                      )
                    else
                      const Text('Thất Bại',
                          style: TextStyle(color: Colors.red, fontSize: 50)),
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    if (winner() == true)
                      const Row(children: [
                        Image(
                          image: AssetImage('images/winner.png'),
                          width: 200,
                          height: 200,
                        ),
                        Image(
                          image: AssetImage('images/arrow-up.png'),
                          width: 50,
                          height: 50,
                        ),
                      ])
                    else
                      const Row(children: [
                        Image(
                          image: AssetImage('images/trophy.png'),
                          width: 200,
                          height: 200,
                        ),
                        Image(
                          image: AssetImage('images/down.png'),
                          width: 50,
                          height: 50,
                        ),
                      ]),
                    const Padding(padding: EdgeInsets.only(top: 50)),
                    scoreShow(),
                    const Padding(padding: EdgeInsets.only(top: 70)),
                    const Text(
                      'Ấn màn hình để tiếp tục',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool winner() {
    if (host > competitor && dataList[0]['host'] == widget.username) {
      return true;
    } else if (host < competitor && dataList[0]['host'] != widget.username) {
      return true;
    } else {
      return false;
    }
  }

  Widget scoreShow() {
    if (host > competitor) {
      max = host;
      win = dataList[0]['host'];
      min = competitor;
      lost = dataList[0]['competitor'];
    } else {
      max = competitor;
      win = dataList[0]['competitor'];
      min = host;
      lost = dataList[0]['host'];
    }

    return Column(
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: '$win : ',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: max.toString(),
              style: const TextStyle(color: Colors.yellow, fontSize: 20),
            ),
          ]),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: '$lost : ',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: min.toString(),
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
          ]),
        ),
      ],
    );
  }

  int getInitial(String string) {
    return int.parse(string);
  }

  void delRoom() {
    final room = FirebaseFirestore.instance.collection('room_list').doc(docid);
    room.delete();
  }
}
