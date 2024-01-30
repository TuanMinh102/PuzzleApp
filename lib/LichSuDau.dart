import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/TrangChu.dart';
import 'package:stroke_text/stroke_text.dart';

class LichSuDau extends StatefulWidget {
  final String username;
  const LichSuDau({super.key, required this.username});

  @override
  State<LichSuDau> createState() => _LichSuDauState();
}

class _LichSuDauState extends State<LichSuDau> {
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
                          builder: (context) =>
                              TrangChu(username: widget.username),
                        ),
                      );
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'Lịch Sử Đấu',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('room_list')
                    .where(Filter.or(Filter("host", isEqualTo: widget.username),
                        Filter("competitor", isEqualTo: widget.username)))
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text('Something wrong');
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    List<DocumentSnapshot> historyList = snapshot.data!.docs;
                    return history(historyList);
                  } else {
                    List<DocumentSnapshot> historyList = snapshot.data!.docs;
                    return history(historyList);
                  }
                }),
          ]),
        ),
      ),
    );
  }

  Widget history(var historylist) {
    return Expanded(
      child: Center(
        child: Container(
          width: 340,
          height: 550,
          color: Colors.white.withOpacity(0.5),
          child: Column(
            children: [
              for (int i = 0; i < historylist.length; i++)
                if (historylist[i]['finish'] == 'true')
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
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
                          const Image(
                            image: AssetImage('images/user.png'),
                            width: 30,
                            height: 30,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          Container(
                            width: 1,
                            color: Colors.black,
                            height: 30,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          SizedBox(
                            width: 90,
                            child: Center(
                              child: StrokeText(
                                text:
                                    historylist[i]['winner'] == widget.username
                                        ? "Chiến Thắng"
                                        : "Thất Bại",
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: historylist[i]['winner'] ==
                                            widget.username
                                        ? Colors.yellow
                                        : Colors.red),
                                strokeColor: Colors.black,
                                strokeWidth: 1.5,
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          Container(
                            width: 1,
                            color: Colors.black,
                            height: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                          ),
                          SizedBox(
                            width: 55,
                            child: Center(
                              child: Text(
                                historylist[i]['host'] == widget.username
                                    ? 'Score:' + historylist[i]['score_host']
                                    : 'Score:' +
                                        historylist[i]['score_competitor'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          Container(
                            width: 1,
                            color: Colors.black,
                            height: 30,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          Column(children: [
                            const Text(
                              'Đấu Đối Kháng',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              historylist[i]['day'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
