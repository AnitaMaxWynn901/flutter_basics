import 'package:flutter/material.dart';

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  @override
  State<Assignment2> createState() => _Assignment2State();
}

class _Assignment2State extends State<Assignment2> {

  final TextEditingController input1 = TextEditingController();
  final TextEditingController input2 = TextEditingController();
  String output = '';

  void _calculateSum() {
    final num1 = int.tryParse(input1.text);
    final num2 = int.tryParse(input2.text);

    if (num1 != null && num2 != null) {
      setState(() {
        output = 'Sum: ${(num1 + num2).toStringAsFixed(0)}';
      });
    } else {
      setState(() {
        output = 'Incorrect input';
      });
    }
  }

  void _clear() {
    setState(() {
      input1.clear();
      input2.clear();
      output = '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: input1,
                    decoration: const InputDecoration(
                      hintText: 'First Number',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  '+',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: input2,
                    decoration: const InputDecoration(
                      hintText: 'Second Number',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: 
                  ElevatedButton(
                    onPressed: _calculateSum,
                    style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.blue,
                     ),

                     child: const Text(
                        'Calculate',
                        style: TextStyle(
                          color: Colors.white,
                        )
                     ),),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: 
                  ElevatedButton(
                    onPressed: _clear,
                    style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.red,
                     ),
                     child: const Text(
                        'Clear',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                     ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Text(
              output,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
