import 'package:flutter/material.dart';
import 'package:myapp/listview/drawer_help.dart';


class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
     return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //header
          DrawerHeader(
            child: Row(
              children: [
                Image.asset(
                  'assets/images/cat-sleep-icon.png',
                  width: 100,
                ),
                const Text('Header'),
              ],
            ),
          ),
          //body
          TextButton.icon(
            onPressed: () {
              //return to home page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DrawerHelp(),
                ),
              );
            },
            label: const Text('Home'),
            icon: const Icon(Icons.add),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DrawerHelp(),
                ),
              );
            },
            label: const Text('Help'),
            icon: const Icon(Icons.heart_broken),
          ),
        ],
      ),
    );
  }
}