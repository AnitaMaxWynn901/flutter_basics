// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

  Color bgColor = Color(0xFF202020);
  Color primaryColor = Color(0xFFFFBD73);

class Baking extends StatelessWidget {
  const Baking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //image
          Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/baking.jpg',
                fit: BoxFit.cover,
              )),
          //other widgets
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const Spacer(),
                Text(
                  'Baking Lessons'.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Master the art of baking'.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                ),
                const Spacer(),
                FilledButton.icon(
                  onPressed: () {},
                  label: Text(
                    'start learning'.toUpperCase(),
                  ),
                  icon: Icon(Icons.arrow_forward),
                  iconAlignment: IconAlignment.end,
                  style: FilledButton.styleFrom(backgroundColor: primaryColor, foregroundColor: bgColor),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
