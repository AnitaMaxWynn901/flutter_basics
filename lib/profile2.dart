import 'package:flutter/material.dart';

class Profile2 extends StatelessWidget {
  const Profile2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://icons.iconarchive.com/icons/icons8/windows-8/256/Cinema-Spiderman-Head-icon.png'),
              radius: 70,
              backgroundColor: Colors.white,
            ),
            const Text(
              'Spider Man',
              style: TextStyle(
                  fontSize: 30, color: Colors.white, fontStyle: FontStyle.italic),
            ),
            Text(
              'Flutter Developer'.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: const Row(
                children: [
                  Icon(Icons.phone, color: Colors.teal),
                  SizedBox(width: 4),
                  Text('06-552-98515')
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: const Row(
                children: [
                  Icon(Icons.email, color: Colors.teal),
                  SizedBox(width: 4),
                  Text('Peterparker123@abc.com')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
