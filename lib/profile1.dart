import 'package:flutter/material.dart';

class Profile1 extends StatelessWidget {
  const Profile1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://icons.iconarchive.com/icons/iconshock/super-heroes-sigma/256/Batman-icon.png'),
                radius: 70,
                backgroundColor: Colors.white,
              ),
            ),
            Divider(
              color: Colors.grey[700],
              height: 30,
            ),
            const Text(
              'Name',
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              'Patrick Bateman',
              style: TextStyle(color: Colors.yellow, fontSize: 25),
            ),
            const Text(
              'Age',
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              '22',
              style: TextStyle(color: Colors.yellow, fontSize: 25),
            ),
            const SizedBox(height: 15),
            const Row(
              children: [
                Icon(Icons.mail, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  'patrick123@abc.com',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
