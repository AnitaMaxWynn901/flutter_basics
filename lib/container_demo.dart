import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container demo'),
      ),
      body: Container(
        width: 100,
        height: 100,
        color: Colors.amber,
        child: Text('Hello'),
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(left: 16),
        padding: EdgeInsets.only(bottom: 8),
      ),
    );
  }
}