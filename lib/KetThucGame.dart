import 'package:flutter/material.dart';
import 'package:giaodien/TrangChu.dart';

// void main() {
//   runApp( KetThucGame());
// }

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
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(
              "images/background.jpg",
            ),
          ),
        ),
        child: Center(
          child: new GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TrangChu(
                            username: widget.username,
                          )),
                );
              },
              child: new Container(
                width: 350,
                height: 500,
                color: Colors.grey.withOpacity(0.8),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('images/winner.png'),
                      width: 200,
                      height: 200,
                    ),
                    Text(
                      'Level' + widget.level.toString(),
                      style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    Padding(padding: EdgeInsets.only(top: 50)),
                    Text(
                      'Score:' + widget.score.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Padding(padding: EdgeInsets.only(top: 70)),
                    Text(
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
