import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/ChoiDon.dart';
import 'package:giaodien/DiemCao.dart';
import 'package:giaodien/DoiKhang.dart';
import 'main.dart';

// void main() {
//   runApp(const TrangChu());
// }

class TrangChu extends StatefulWidget {
  final String username;
  const TrangChu({super.key, required this.username});

  @override
  State<TrangChu> createState() => _TrangChuState();
}

class _TrangChuState extends State<TrangChu> {
  List dataList = [];
  List<String> arr = ['username', 'email'];
  fetchDatabaseList() async {
    // dynamic result2 = await DatabaseManager().getData();
    final result2 = await FirebaseFirestore.instance
        .collection('accounts_list')
        .where('username', isEqualTo: widget.username)
        .get();
    if (result2 == null) {
      print("unable");
    } else {
      setState(() {
        dataList = result2.docs.map((e) => e.data()).toList();
        arr[0] = dataList[0]['username'];
        arr[1] = dataList[0]['email'];
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
    return Scaffold(
      body: Container(
        width: 1920,
        height: 1080,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
          ),
        ),
        child: Center(
          child: Column(children: [
            const Padding(padding: EdgeInsets.only(top: 30)),
            Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.black,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated),
                ),
                child: const Image(
                  image: AssetImage('images/light-bulb.png'),
                )),
            const Padding(padding: EdgeInsets.only(top: 30)),
            SizedBox(
              width: 200,
              height: 35,
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
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChoiDon(
                                  username: widget.username,
                                )),
                      );
                    },
                    child: Text(
                      'Chơi Đơn',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  )),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            SizedBox(
              width: 200,
              height: 35,
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
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoiKhang(
                                  username: widget.username,
                                )),
                      );
                    },
                    child: Text(
                      'Chơi Đối Kháng',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  )),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            SizedBox(
              width: 200,
              height: 35,
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
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiemCao(
                                  username: widget.username,
                                )),
                      );
                    },
                    child: Text(
                      'Điểm Cao',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  )),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            SizedBox(
              width: 200,
              height: 35,
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
                  onPressed: () {},
                  child: Text(
                    'Cài Đặt',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    onSurface: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            SizedBox(
              width: 200,
              height: 35,
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
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DangNhap(),
                      ),
                    );
                  },
                  child: Text(
                    'Exit',
                    style: TextStyle(color: Colors.black, fontSize: 20),
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
      appBar: AppBar(),
      drawer: Drawer(
        child: Container(
          color: Colors.blue.shade700,
          padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage('images/user.png'),
              ),
              const SizedBox(height: 12),
              Text(arr[0],
                  style: const TextStyle(fontSize: 28, color: Colors.white)),
              Text(
                arr[1],
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(30, 60, 0, 0)),
                  SizedBox(
                    width: 150,
                    height: 30,
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
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.history,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const LichSuDau()),
                          // );
                        },
                        label: const Text(
                          'Lịch Sử Đấu',
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
                  const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                  SizedBox(
                    width: 60,
                    height: 30,
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
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.share,
                            color: Colors.black,
                            size: 12,
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const LichSuDau()),
                            // );
                          },
                          label: const Text(''),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            onSurface: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                        )),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              const Divider(
                height: 1,
                color: Colors.white,
              ),
              const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              const Text('Thống kê',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white)),
              const Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage('images/flame.png'),
                        width: 20,
                        height: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      label: const Text.rich(
                        TextSpan(
                          text: '0\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Chuỗi Thắng',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(40, 0, 0, 0)),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage('images/trophy.png'),
                        width: 20,
                        height: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      label: const Text.rich(
                        TextSpan(
                          text: '0\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Trận Thắng',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage('images/silver-medal.png'),
                        width: 20,
                        height: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      label: const Text.rich(
                        TextSpan(
                          text: 'Bạc\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Hiện Tại',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(40, 0, 0, 0)),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage('images/gold-medal.png'),
                        width: 20,
                        height: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      label: const Text.rich(
                        TextSpan(
                          text: 'Vàng\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Cao Nhất',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
