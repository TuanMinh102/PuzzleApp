import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/TrangChu.dart';

class ResultPvP extends StatefulWidget {
  final String username;
  final String idRoom;
  const ResultPvP({super.key, required this.username, required this.idRoom});
  @override
  State<ResultPvP> createState() => _ResultPvPState();
}

class _ResultPvPState extends State<ResultPvP> {
  String docid = 'null';
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

  @override
  void initState() {
    super.initState();
    getdocumentid();
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
              var yourData = snapshot.data?.data() as Map<String, dynamic>?;
              if (yourData != null) {
                return container(yourData);
              } else {
                return const Text('');
              }
            }
          }),
    );
  }

  Widget container(var yourData) {
    return Container(
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
                  if (winner(yourData) == true)
                    const Text(
                      'Chiến Thắng',
                      style: TextStyle(color: Colors.yellow, fontSize: 50),
                    )
                  else
                    const Text('Thất Bại',
                        style: TextStyle(color: Colors.red, fontSize: 50)),
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  if (winner(yourData) == true)
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
                  scoreShow(yourData),
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
    );
  }

  bool winner(var data) {
    if (getInitial(data['score_host']) > getInitial(data['score_competitor']) &&
        data['host'] == widget.username) {
      return true;
    } else if (getInitial(data['score_host']) <
            getInitial(data['score_competitor']) &&
        data['host'] != widget.username) {
      return true;
    } else {
      return false;
    }
  }

  Widget scoreShow(var data) {
    if (getInitial(data['score_host']) > getInitial(data['score_competitor'])) {
      max = getInitial(data['score_host']);
      win = data['host'];
      min = getInitial(data['score_competitor']);
      lost = data['competitor'];
    } else {
      max = getInitial(data['score_competitor']);
      win = data['competitor'];
      min = getInitial(data['score_host']);
      lost = data['host'];
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
