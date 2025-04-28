import 'package:flutter/material.dart';

class AlertDemo extends StatefulWidget {
  const AlertDemo({super.key});

  @override
  State<AlertDemo> createState() => _AlertDemoState();
}

class _AlertDemoState extends State<AlertDemo> {
  String _answer = '';
  void showAlert() async {
    String? answer = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Is this a dog?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/dog.png'),
              const Text('A cute pet'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.pop(context, 'Yes');
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.pop(context, 'No');
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
    if(answer != null){
      setState(() {
        _answer = answer;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            FilledButton(
              onPressed: showAlert,
              child: const Text('Alert'),
            ),
            Text('Your answer is $_answer'),
          ],
        ),
      ),
    );
  }
}
