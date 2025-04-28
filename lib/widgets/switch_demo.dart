import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({super.key});

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool? _cb = false;
  bool? _sw = false;

  void updateCheckbox(bool? value){
    setState(() {
      _cb = value;
    });
  }

  void updateSwitch(bool? value){
    setState(() {
      _sw = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(value: _cb, onChanged: updateCheckbox),
                Text('CheckBox: $_cb',),
              ],
            ),
            Row(
              children: [
                Switch(value: _sw!, onChanged: updateSwitch),
                Text('Switch: $_sw'),
              ],
            ),
          ],
      ),
      ),
    );
  }
}