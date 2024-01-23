import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/DoiKhang.dart';
import 'PvP.dart';

class PhongDau extends StatefulWidget {
  final String username;
  final String idRoom;

  const PhongDau({super.key, required this.username, required this.idRoom});

  @override
  State<PhongDau> createState() => _PhongDauState();
}

class _PhongDauState extends State<PhongDau> {
  String docid = '';

  void start(String documentID) {
    final room =
        FirebaseFirestore.instance.collection('room_list').doc(documentID);
    room.update({'start': '1', 'finish': 'true'});
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              PvP(username: widget.username, idRoom: widget.idRoom)),
    );
  }

  void quitRoom(String documentID, var list) {
    final room =
        FirebaseFirestore.instance.collection('room_list').doc(documentID);
    if (list?['host'] == widget.username && list?['players'] == '1') {
      room.delete();
    } else if (list?['host'] == widget.username && list?['players'] == '2') {
      room.update(
          {'host': list?['competitor'], 'players': '1', 'competitor': ''});
    } else if (list?['competitor'] != list?['host'] &&
        list?['competitor'] != '') {
      room.update({'competitor': '', 'players': '1'});
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
            var yourData = snapshot.data!.data() as Map<String, dynamic>?;
            if (yourData?['start'] == '1') {
              return PvP(
                username: widget.username,
                idRoom: widget.idRoom,
              );
            } else {
              return Container(
                width: 1080,
                height: 1920,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
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
                          icon: const Icon(
                            Icons.keyboard_arrow_left,
                            size: 40,
                          ),
                          color: Colors.black,
                          onPressed: () {
                            quitRoom(docid, yourData);
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
                        const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                        const Center(
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
                  const Padding(padding: EdgeInsets.all(20)),
                  Center(
                    child: Row(children: [
                      const Padding(padding: EdgeInsets.only(left: 80)),
                      Column(children: [
                        const Image(
                          image: AssetImage('images/crown.png'),
                          width: 30,
                          height: 30,
                        ),
                        const Image(
                          image: AssetImage('images/user.png'),
                          width: 55,
                          height: 55,
                        ),
                        Text(yourData?['host']),
                      ]),
                      const Padding(padding: EdgeInsets.only(left: 30)),
                      const Image(
                        image: AssetImage('images/vs.png'),
                        width: 55,
                        height: 55,
                      ),
                      const Padding(padding: EdgeInsets.only(left: 30)),
                      Column(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          if (yourData?['competitor'] == '')
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
                            const Image(
                              image: AssetImage('images/user.png'),
                              width: 55,
                              height: 55,
                            ),
                          Text(yourData?['competitor']),
                        ],
                      ),
                    ]),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 70)),
                  if (yourData?['players'] == '2' &&
                      yourData?['host'] == widget.username)
                    ElevatedButton.icon(
                      onPressed: () {
                        start(docid);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      icon: const Image(
                        image: AssetImage('images/boxing-gloves.png'),
                        width: 35,
                        height: 35,
                      ),
                      label: const Text('Bắt Đầu',
                          style: TextStyle(color: Colors.white)),
                    ),
                ]),
              );
            }
          }),
    );
  }
}
