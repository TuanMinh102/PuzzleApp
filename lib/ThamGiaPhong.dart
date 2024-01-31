import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/DoiKhang.dart';
import 'package:giaodien/PhongDau.dart';

class ThamGiaPhong extends StatefulWidget {
  final String username;
  const ThamGiaPhong({super.key, required this.username});

  @override
  State<ThamGiaPhong> createState() => _ThamGiaPhongState();
}

class _ThamGiaPhongState extends State<ThamGiaPhong> {
  String docid = 'null';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('room_list').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Something wrong');
            } else if (!snapshot.hasData || snapshot.data == null) {
              List<DocumentSnapshot> roomList = snapshot.data!.docs;
              return container(roomList);
            } else {
              List<DocumentSnapshot> roomList = snapshot.data!.docs;
              return container(roomList);
            }
          }),
    );
  }

  Widget container(var roomList) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
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
                        builder: (context) => DoiKhang(
                          username: widget.username,
                        ),
                      ),
                    );
                  },
                ),
                const Expanded(
                  child: Text(
                    'Tham Gia Phòng',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 160,
            height: 20,
            child: TextField(
                // controller: username,
                decoration: InputDecoration(
              labelText: "Nhập mã phòng",
              icon: Icon(Icons.search),
            )),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Container(
            width: 340,
            height: 550,
            color: Colors.white.withOpacity(0.5),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20)),
                for (int i = 0;
                    i < roomList.length &&
                        roomList[i]['finish'].toString() != 'true';
                    i++)
                  Container(
                    width: 310,
                    height: 40,
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
                      color: Colors.white.withOpacity(0.77),
                    ),
                    child: Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          'Id:' + roomList[i]['id'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 1,
                          color: Colors.black,
                          height: 30,
                        ),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          'Host:' + roomList[i]['host'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 1,
                          color: Colors.black,
                          height: 30,
                        ),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          'Players:' + roomList[i]['players'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 1,
                          color: Colors.black,
                          height: 30,
                        ),
                        IconButton(
                          icon: const Icon(Icons.login),
                          onPressed: () {
                            join(i, roomList);
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

//tham gia vao phong
  void join(int index, var roomList) {
    if (roomList[index]['players'] == '2') {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Row(
                  children: [
                    Text(
                      'Tham gia thất bại',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                content: Text("Phòng đã đủ người"),
              ),
          barrierDismissible: true);
    } else {
      final id = FirebaseFirestore.instance
          .collection('room_list')
          .where('id', isEqualTo: roomList[index]['id'])
          .get()
          .then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((DocumentSnapshot doc) {
          setState(() {
            docid = doc.id;
            final roomref =
                FirebaseFirestore.instance.collection('room_list').doc(docid);
            roomref.update({'competitor': widget.username, 'players': '2'});
          });
        });
      });
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhongDau(
            username: widget.username,
            idRoom: roomList[index]['id'],
          ),
        ),
      );
    }
  }
}
