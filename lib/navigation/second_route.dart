import 'package:flutter/material.dart';
import 'package:myapp/navigation/third_route.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {

double slValue = 0.0;

  @override
  Widget build(BuildContext context) {
    // get the data
  Map data = ModalRoute.of(context)!.settings.arguments as Map;
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('Name : ${data['name']}'),
            Text('Age : ${data['age']}'),
            Text('Sex : ${data['gender']}'),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
                // Navigator.of(context).pop();
              },
              child: const Text('Back'),
            ),
            FilledButton(
            onPressed: () async {
            slValue = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ThirdRoute(),
              ),
            );
            setState(() {
              
            });
          },
          child: const Text('Next'),
        ),
        Text('Slider = $slValue'),
          ],
        ),
      ),
    );
  }
}
