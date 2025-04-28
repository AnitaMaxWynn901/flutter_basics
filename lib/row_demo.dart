import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget {
  const RowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Demo'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.amber,
          ),
          Container(
            width: 100,
            height: 200,
            color: Colors.blue,
          ),
          Expanded(
            child: Container(
              width: 500,
              height: 100,
              color: Colors.red,
            ),
          ),
        ]
      ),
    );
  }
}