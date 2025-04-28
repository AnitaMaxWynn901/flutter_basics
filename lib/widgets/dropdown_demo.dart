import 'package:flutter/material.dart';

class DropdownDemo extends StatefulWidget {
  const DropdownDemo({super.key});

  @override
  State<DropdownDemo> createState() => _DropdownDemoState();
}

class _DropdownDemoState extends State<DropdownDemo> {

  String _dd = 'All Years';
  void updateDropdown (String? value){
    setState(() {
      _dd = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DropdownButton(
              value: '$_dd',
              items: const [
              DropdownMenuItem(
                value: 'All Years',
                child: Text('All Years'),
              ),
              DropdownMenuItem(
                value: '2024',
                child: Text('2024'),
              ),
              DropdownMenuItem(
                value: '2023',
                child: Text('2023'),
              ),
            ], onChanged: updateDropdown),
            Text('You select: $_dd'),
          ],
        ),
      ),
    );
  }
}
