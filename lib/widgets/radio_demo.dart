import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({super.key});

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _gValue = 0;
  int _gender = 1;
  final List coffees = ['latte', 'capu', 'amer'];

  void updateRadio(int? value) {
    setState(() {
      _gValue = value!;
    });
  }

  void updateGender(int? value) {
    setState(() {
      _gender = value!;
    });
  }

  int _gCoffee = 0;
  List<Widget> createCoffeeRadios() {
    // return [Radio(value: value, groupValue: groupValue, onChanged: onChanged)];
    List<Widget> radios = [];
    for (int i = 0; i < coffees.length; i++) {
      radios.add(
        Radio(
          value: i,
          groupValue: _gCoffee,
          onChanged: (int? value) {
            setState(() {
              _gCoffee = value!;
            });
          },
        ),
      );
      radios.add(
        Text(coffees[i]),
      );
    }
    return radios;
  }

  void updateCoffee(int? value) {
    setState(() {
      _gCoffee = value!;
    });
  }

  List<Widget> createCoffeeRadios2() {
    return List.generate(coffees.length, (index) {
      return Radio(value: index, groupValue: _gCoffee, onChanged: updateCoffee);
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
                Radio(value: 0, groupValue: _gValue, onChanged: updateRadio),
                const Text('0'),
                Radio(value: 1, groupValue: _gValue, onChanged: updateRadio),
                const Text('1'),
                Radio(value: 2, groupValue: _gValue, onChanged: updateRadio),
                const Text('2'),
                const Spacer(),
                Text('Select: $_gValue'),
              ],
            ),
            Row(
              children: [
                Radio(value: 1, groupValue: _gender, onChanged: updateGender),
                const Text('Female'),
                Radio(value: 2, groupValue: _gender, onChanged: updateGender),
                const Text('Male'),
                const Spacer(),
                Text('Select: ${_gender == 1 ? 'Female' : 'Male'}'),
              ],
            ),
            Row(
              children: createCoffeeRadios(),
            ),
            Row(
              children: createCoffeeRadios2(),
            ),
          ],
        ),
      ),
    );
  }
}
