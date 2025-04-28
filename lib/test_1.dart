import 'package:flutter/material.dart';
import 'dart:math';

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  int _player1randomnumber = Random().nextInt(10);
  int _player2randomnumber = Random().nextInt(10);

  int p1heart = 10;
  int p2heart = 10;

  String message1 = '';
  String message2 = '';
  String message3 = "Let the fight begin!";
  String message4 = '';

  void _p1Attack() {
    setState(() {
      _player1randomnumber = Random().nextInt(10);
      message3 = 'Player 1 attacks for $_player1randomnumber damage';

      p2heart = p2heart - _player1randomnumber;
      if (p2heart <= 0) {
        p2heart = 0;
        message4 = 'Player 1 wins!';
      } else {
        message4 = '';
      }
    });
  }

  void _p2Attack() {
    setState(() {
      _player2randomnumber = Random().nextInt(10);
      message3 = 'Player 2 attacks for $_player2randomnumber damage';

      p1heart = p1heart - _player2randomnumber;
      if (p1heart <= 0) {
        p1heart = 0;
        message4 = 'Player 2 wins!';
      } else {
        message4 = '';
      }
    });
  }

  void _replay() {
    setState(() {
      p1heart = 10;
      p2heart = 10;
      message3 = "Let the fight begin!";
      message4 = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Battle Game',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Player Avatars and Hearts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Player 1
                Column(
                  children: [
                    const Text('Player 1', style: TextStyle(fontSize: 20),),
                    Image.asset(
                      'assets/images/salad.jpg',
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.favorite,
                            color: i < p1heart ? Colors.red : Colors.black,
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 5; i < 10; i++)
                          Icon(
                            Icons.favorite,
                            color: i < p1heart ? Colors.red : Colors.black,
                          ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: p1heart > 0 && p2heart > 0 ? _p1Attack : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Attack'),
                    ),
                  ],
                ),
                // Player 2
                Column(
                  children: [
                    const Text('Player 2', style: TextStyle(fontSize: 20),),
                    Image.asset(
                      'assets/images/salad.jpg',
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.favorite,
                            color: i < p2heart ? Colors.red : Colors.black,
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 5; i < 10; i++)
                          Icon(
                            Icons.favorite,
                            color: i < p2heart ? Colors.red : Colors.black,
                          ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: p1heart > 0 && p2heart > 0 ? _p2Attack : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 81, 147, 227),
                      ),
                      child: const Text('Attack'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Game Messages
            Text(
              message3,
              style: const TextStyle(fontSize: 15,),
            ),
            const SizedBox(height: 10),
            Text(
              message4,
              style: const TextStyle(fontSize: 15,),
            ),
            const SizedBox(height: 20),
            // Replay Button
            ElevatedButton(
              onPressed: _replay,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Replay'),
            ),
          ],
        ),
      ),
    );
  }
}