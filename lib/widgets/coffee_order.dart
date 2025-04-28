import 'package:flutter/material.dart';

class CoffeeOrder extends StatefulWidget {
  const CoffeeOrder({super.key});

  @override
  State<CoffeeOrder> createState() => _CoffeeOrderState();
}

class _CoffeeOrderState extends State<CoffeeOrder> {
  double _sl = 1.0; // Normal sugar level
  bool _isCold = false; // Default to hot coffee

  String getSugarLevelText(double value) {
    if (value == 0) {
      return 'none';
    } else if (value == 0.5) {
      return 'less';
    } else {
      return 'normal';
    }
  }

  String getCoffeeTypeText(bool isCold) {
    return isCold ? 'Cold' : 'Hot';
  }

  void updateSlider(double value) {
    setState(() {
      _sl = value;
    });
  }

  void updateSwitch(bool value) {
    setState(() {
      _isCold = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MFU Coffee Shop',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Order',
                  style: TextStyle(fontSize: 26),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Type'),
                const Spacer(),
                const Text('Hot'),
                Switch(value: _isCold, onChanged: updateSwitch),
                const Text('Cold'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sugar level'),
                Slider(
                  value: _sl,
                  onChanged: updateSlider,
                  divisions: 2,
                  label: getSugarLevelText(_sl),
                  min: 0,
                  max: 1,
                ),
                const Text('Normal'),
              ],
            ),
            FilledButton(
              onPressed: () {
                // Display the order in a dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Your order'),
                      content: Text(
                        '${getCoffeeTypeText(_isCold)} coffee with ${getSugarLevelText(_sl)} sugar',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Order'),
            ),
          ],
        ),
      ),
    );
  }
}
