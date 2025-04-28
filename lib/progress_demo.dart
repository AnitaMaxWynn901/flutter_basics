import 'dart:async';
import 'package:flutter/material.dart';

class ProgressDemo extends StatefulWidget {
  const ProgressDemo({super.key});

  @override
  State<ProgressDemo> createState() => _ProgressDemoState();
}

class _ProgressDemoState extends State<ProgressDemo> {

  bool progress = true;

  @override
  void initState() {
    super.initState();
    // delay for 3 seconds
    Timer(const Duration(seconds: 3), () {
      setState(() {
        progress = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: progress
            ? const CircularProgressIndicator(
                backgroundColor: Colors.red,
              )
            : const Text('Ready'),
      ),
    );
  }
}