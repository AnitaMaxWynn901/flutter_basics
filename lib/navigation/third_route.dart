import 'package:flutter/material.dart';
import 'package:myapp/navigation/first_route.dart';

class ThirdRoute extends StatefulWidget {
  const ThirdRoute({super.key});

  @override
  State<ThirdRoute> createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  double slValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Column(
        children: [
          Slider(value: slValue, onChanged: (value){
            setState(() {
              slValue = value;
            });
          }),
          FilledButton(
          onPressed: () {
            Navigator.pop(context, slValue);
            // Navigator.of(context).pop();
          },
          child: const Text('Back'),
          ),
          FilledButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
              builder: (context) => const FirstRoute(),
            ),
              (route) => false,
            );
            // Navigator.pop(context, slValue);
            // Navigator.of(context).pop();
          },
          child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
