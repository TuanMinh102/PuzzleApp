import 'package:flutter/material.dart';
import 'DoiKhang.dart';

class NapCredit extends StatefulWidget {
  final String username;
  const NapCredit({super.key, required this.username});

  @override
  State<NapCredit> createState() => _NapCreditState();
}

class _NapCreditState extends State<NapCredit> {
  int item = 0;
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
                          builder: (context) => DoiKhang(
                                username: widget.username,
                              )),
                    );
                  },
                ),
                const Expanded(
                  child: Text(
                    'Nạp Credit',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 250, top: 10),
            width: 100,
            height: 40,
            color: const Color.fromARGB(255, 241, 241, 241),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('images/light-bulb.png'),
                  width: 70,
                  height: 30,
                ),
                Text(
                  '$item',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
          FloatingActionButton.extended(
            label: const Text(
              '10 / 20.000 VNĐ',
            ),
            backgroundColor: Colors.white,
            icon: const Image(
              image: AssetImage('images/light-bulb.png'),
              width: 30,
              height: 30,
            ),
            onPressed: () {},
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
          FloatingActionButton.extended(
            label: const Text('30 / 50.000 VNĐ'),
            backgroundColor: Colors.white,
            icon: const Image(
              image: AssetImage('images/light-bulb.png'),
              width: 30,
              height: 30,
            ),
            onPressed: () {},
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
          FloatingActionButton.extended(
            label: const Text('65 / 100.000 VNĐ'),
            backgroundColor: Colors.white,
            icon: const Image(
              image: AssetImage('images/light-bulb.png'),
              width: 30,
              height: 30,
            ),
            onPressed: () {},
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
          FloatingActionButton.extended(
            label: const Text('115 / 200.000 VNĐ'),
            backgroundColor: Colors.white,
            icon: const Image(
              image: AssetImage('images/light-bulb.png'),
              width: 30,
              height: 30,
            ),
            onPressed: () {},
          ),
        ]),
      ),
    ));
  }
}
