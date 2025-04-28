import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});

  @override
  State<SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sl = 0.5;
  double _sl2 = 0.0;

  void updateSlider(double value) {
    setState(() {
      _sl = value;
    });
  }
  void updateSlider2(double value) {
    setState(() {
      _sl2 = value;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Default Slider $_sl'),
            Slider(
              value: _sl,
              onChanged: updateSlider,
              divisions: 10,
            ),
            Text('Custom Slider $_sl2'),
            Slider(
              value: _sl2,
              onChanged: updateSlider2,
              divisions: 5,
              min: 0,
              max: 100,
              label: _sl2.round().toString(), //'$_sl2' can also be used.
            ),
          ],
        ),
      ),
    );
  }
}
