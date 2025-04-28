import 'package:flutter/material.dart';

class StyleDemo extends StatelessWidget {
  StyleDemo({super.key});
  TextStyle myTextStyle = TextStyle(fontSize: 30, color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'First Text',
              style: myTextStyle,
            ),
            Text(
              'Second Text',
              style: myTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
