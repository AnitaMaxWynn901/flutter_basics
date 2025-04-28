import 'package:flutter/material.dart';
import 'package:myapp/listview/drawer_menu.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Demo'),
      ),
      drawer: const DrawerMenu(),
      body: const Text('Welcome page'),
    );
  }
}
