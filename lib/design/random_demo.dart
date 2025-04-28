import 'dart:math';
import 'package:flutter/material.dart';

class RandomDemo extends StatefulWidget {
  const RandomDemo({super.key});

  @override
  State<RandomDemo> createState() => _RandomDemoState();
}

class _RandomDemoState extends State<RandomDemo> {
  final TextEditingController input = TextEditingController();
  String output = '';
  int answer = Random().nextInt(10); // Generate a random number between 0 and 9
  int attemptsLeft = 3;
  bool gameOver = false;

  void checkGuess() {
    // Get the user's guess
    int guess;
    if (int.tryParse(input.text) != null) {
      guess = int.tryParse(input.text)!; // Since it's not null, can safely use the parsed value
    } else {
      guess = -1; // If parsing fails, assign -1
    } // Handle non-numeric input

    // Check if the input is valid
    if (guess < 0 || guess > 9) {
      setState(() {
        output = 'Please enter a valid number between 0 and 9';
      });
      return;
    }

    // Check if attempts are left
    if (attemptsLeft > 0) {
      setState(() {
        if (guess == answer) {
          output = 'Correct, you win!';
          gameOver = true;
        } else if (guess < answer) {
          attemptsLeft--;
          output = '$guess is too small, $attemptsLeft chance(s) left!';
        } else {
          attemptsLeft--;
          output = '$guess is too large, $attemptsLeft chance(s) left!';
        }

        // If no attempts left, the player loses
        if (attemptsLeft == 0 && guess != answer) {
          output = 'Sorry, you lose. The answer is $answer';
          gameOver = true;
        }
      });
    }
  }

  void resetGame() {
    setState(() {
      answer = Random().nextInt(10); // Generate a new random number
      attemptsLeft = 3; // Reset the number of attempts
      output = '';
      gameOver = false;
      input.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Guess a number game',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: input,
                decoration: const InputDecoration(
                  hintText: 'Guess a number 0-9',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Text(
                output,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  if (gameOver) {
                    resetGame();
                  } else {
                    checkGuess();
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white, // White background color
                  foregroundColor: Colors.black, // Black text color
                  side: const BorderSide(
                      color: Colors.purple, width: 1), // Purple border
                ),
                child: () {
                  if (gameOver) {
                    return const Text('Replay');
                  } else {
                    return const Text('Guess');
                  }
                }(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
