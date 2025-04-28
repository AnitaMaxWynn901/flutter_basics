import 'package:flutter/material.dart';

class CoffeeOrder1 extends StatefulWidget {
  const CoffeeOrder1({super.key});

  @override
  State<CoffeeOrder1> createState() => _CoffeeOrder1State();
}

class _CoffeeOrder1State extends State<CoffeeOrder1> {
  double _sl = 1.0;
  int _gValue = 0;
  bool _isCold = false;
  bool _isOrderConfirmed = false; 

  String getCoffeeTypeText(bool isCold) {
    return isCold ? 'Cold' : 'Hot';
  }

  String getSugarLevelText(double value) {
    if (value == 0) {
      return 'none';
    } else if (value == 0.5) {
      return 'less';
    } else {
      return 'normal';
    }
  }

  String getCoffeeName(int value) {
    if (value == 0) {
      return 'Latte';
    } else if (value == 1) {
      return 'Americano';
    } else {
      return 'Cappuccino';
    }
  }

  String getImageAssetPath(int value, bool isCold) {
    if (value == 0) {
      return isCold ? 'assets/images/cold_latte.jpeg' : 'assets/images/hot_latte.jpeg';
    } else if (value == 1) {
      return isCold ? 'assets/images/cold_americano.jpeg' : 'assets/images/hot_americano.jpeg';
    } else {
      return isCold ? 'assets/images/cold_cappuccino.jpeg' : 'assets/images/hot_cappuccino.jpeg';
    }
  }

  void updateSlider(double value) {
    setState(() {
      _sl = value;
    });
  }

  void updateRadio(int? value) {
    setState(() {
      _gValue = value!;
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
        title: const Text('MFU Coffee Shop', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your Order', style: TextStyle(fontSize: 26)),
              ],
            ),
            Column(
              children: [
                const Row(
                  children: [
                    Text('Coffee', style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 0, groupValue: _gValue, onChanged: updateRadio),
                    const Text('Latte 35'),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 1, groupValue: _gValue, onChanged: updateRadio),
                    const Text('Americano 30'),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 2, groupValue: _gValue, onChanged: updateRadio),
                    const Text('Cappuccino 40'),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Text('Type'),
                const Spacer(),
                const Text('Hot'),
                Switch(value: _isCold, onChanged: updateSwitch),
                const Text('Cold +5'),
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
                String coffeeName = getCoffeeName(_gValue);
                String coffeeType = getCoffeeTypeText(_isCold);
                String sugarLevel = getSugarLevelText(_sl);
                String imagePath = getImageAssetPath(_gValue, _isCold);
                int price = (_gValue == 0) ? 35 : (_gValue == 1) ? 30 : 40;
                if (_isCold) price += 5;

                // Display the order in a dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Your order'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(imagePath), 
                          const SizedBox(height: 10),
                          Text(
                            '$coffeeType $coffeeName with $sugarLevel sugar.\nPrice = $price baht',
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isOrderConfirmed = true; 
                            });
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
            if (_isOrderConfirmed)
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Thank you for your order!',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
