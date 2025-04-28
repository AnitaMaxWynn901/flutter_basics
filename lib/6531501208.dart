import 'package:flutter/material.dart';
import 'dart:math';

class Labtest extends StatefulWidget {
  const Labtest({super.key});

  @override
  State<Labtest> createState() => _LabtestState();
}

class _LabtestState extends State<Labtest> {
  int player1_randomnumber = Random().nextInt(10);
  int player2_randomnumber = Random().nextInt(10);
  int player1_coin = 0;
  int player2_coin = 0;
  int totalcoins = 10;
  int random = Random().nextInt(10);
  String message1 = '';
  String message2 = '';
  bool gameOver = false;

  void player1_collect() {
    setState(() {
      player1_randomnumber = Random().nextInt(10);
      message1 = 'Player 1 collects $player1_randomnumber coins';
      player1_coin = player1_coin + player1_randomnumber;
      totalcoins = totalcoins - player1_randomnumber;
      if (totalcoins <= 0) {
        _checkWinner();
      } else if (player1_coin == player2_coin) {
        message2 = 'Draw';
      }
    });
  }

  void player2_collect() {
    setState(() {
      player2_randomnumber = Random().nextInt(10);
      message1 = 'Player 2 collects $player2_randomnumber coins';
      player2_coin = player2_coin + player2_randomnumber;
      totalcoins = totalcoins - player2_randomnumber;
      if (totalcoins <= 0) {
        _checkWinner();
        gameOver = true;
      } else if (player1_coin == player2_coin) {
        message2 = 'Draw';
      }
    });
  }

  void _checkWinner() {
    gameOver = true;
    if (player1_coin > player2_coin) {
      message2 = 'Player 1 wins!';
    } else if (player2_coin > player1_coin) {
      message2 = 'Player 2 wins! ';
    } else {
      message2 = 'Draw';
    }
  }

  void replayGame() {
    setState(() {
      random = Random().nextInt(10);
      totalcoins = 10;
      message1 = 'Let start collect coins!';
      message2 = '';
      gameOver = false;
      player1_coin = 0;
      player2_coin = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Treasure Game',
          style: TextStyle(color: Colors.yellow),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  children: [
                    Text('Total Coins'),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.paid,
                            color:
                                i < totalcoins ? Colors.yellow : Colors.black,
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        for (int i = 5; i < 10; i++)
                          Icon(
                            Icons.paid,
                            color:
                                i < totalcoins ? Colors.yellow : Colors.black,
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Player 1',
                    ),
                    Image.asset(
                      'assets/images/dig1.png',
                    ),
                    Text(' $player1_coin coins'),
                    ElevatedButton(
                      onPressed: player1_collect,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'collect',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Player 2',
                    ),
                    Image.asset(
                      'assets/images/dig2.png',
                    ),
                    Text(' $player2_coin coins'),
                    ElevatedButton(
                      onPressed: player2_collect,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'collect',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(message1),
                const SizedBox(
                  height: 15,
                ),
                Text(message2),
                const SizedBox(height: 15,),
                ElevatedButton(
                  onPressed: replayGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Replay',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
