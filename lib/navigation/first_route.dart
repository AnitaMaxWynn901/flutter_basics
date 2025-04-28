import 'package:flutter/material.dart';
import 'package:myapp/navigation/second_route.dart';

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key});

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  Map student = {
    'name': 'Johan',
    'age': 20,
    'gender': 'male',
  };

  final tcName = TextEditingController();

  final tcAge = TextEditingController();

  bool gender = false;

  void updateSwitch(bool? value){
    setState(() {
      gender = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Name'),
              controller: tcName,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Age'),
              controller: tcAge,
            ),
            Row(
              children: [
                const Text('Female'),
                Switch(value: gender, onChanged: updateSwitch),
                const Text('Male'),
              ],
            ),
            FilledButton(
              onPressed: () {
                student['name'] = tcName.text;
                student['age'] = int.parse(tcAge.text);     
                student['gender'] = gender == false ? 'female' : 'male';
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondRoute(),
                      settings: RouteSettings(arguments: student)),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
