import 'package:flutter/material.dart';

class DrawerHelp extends StatelessWidget {
  const DrawerHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: const Text('Help page'),
    );
  }
}
