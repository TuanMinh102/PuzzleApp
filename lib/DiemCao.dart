import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/TrangChu.dart';

class DiemCao extends StatefulWidget {
  final String username;
  const DiemCao({super.key, required this.username});

  @override
  State<DiemCao> createState() => _DiemCaoState();
}

class _DiemCaoState extends State<DiemCao> {
  List dataList = [];
  List<String> arr = ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0'];

  fetchDatabaseList() async {
    // dynamic result2 = await DatabaseManager().getData();
    final result2 = await FirebaseFirestore.instance
        .collection('highscore')
        .where('username', isEqualTo: widget.username)
        .get();
    if (result2 == null) {
      print("unable");
    } else {
      setState(() {
        dataList = result2.docs.map((e) => e.data()).toList();

        for (int i = 1; i <= 10; i++)
          arr[i - 1] = dataList[0]['ai$i'].toString();
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
          child: Column(
            children: [
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
                              builder: (context) => TrangChu(
                                    username: widget.username,
                                  )),
                        );
                      },
                    ),
                    const Expanded(
                      child: Text(
                        'Điểm Cao',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 60)),
              Container(
                width: 400,
                height: 30,
                child: Text(
                  widget.username,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
              ),
              Container(
                width: 400,
                height: 450,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Column(
                      children: [
                        Text(
                          'Cấp',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.red),
                        ),
                        for (int i = 1; i <= 10; i++)
                          Text(
                            i.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 150)),
                    Column(
                      children: [
                        Text(
                          'Điểm',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.red),
                        ),
                        for (int i = 0; i < arr.length; i++)
                          Text(arr[i].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 227, 222, 222),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
