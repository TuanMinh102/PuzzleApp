import 'package:flutter/material.dart';
import 'package:giaodien/TrangChu.dart';

class KetThucGame extends StatefulWidget {
  final int score;
  final int level;
  final String username;
  const KetThucGame(
      {super.key,
      required this.score,
      required this.level,
      required this.username});
  @override
  State<KetThucGame> createState() => _KetThucGameState();
}

class _KetThucGameState extends State<KetThucGame> {
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
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TrangChu(
                            username: widget.username,
                          )),
                );
              },
              child: Container(
                width: 350,
                height: 500,
                color: Colors.grey.withOpacity(0.8),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('images/winner.png'),
                      width: 200,
                      height: 200,
                    ),
                    Text(
                      'Cấp ' + widget.level.toString(),
                      style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 50)),
                    Text(
                      'Điểm: ' + widget.score.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 90)),
                    const Text(
                      'Ấn màn hình để tiếp tục',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
