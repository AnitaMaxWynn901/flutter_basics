import 'package:flutter/material.dart';

class Assignment3 extends StatefulWidget {
  const Assignment3({super.key});

  @override
  State<Assignment3> createState() => _Assignment3State();
}

class _Assignment3State extends State<Assignment3> {
  final TextEditingController color1 = TextEditingController();
  final TextEditingController color2 = TextEditingController();
  final TextEditingController color3 = TextEditingController();

  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ARGB Color Mixing'),
        foregroundColor: Colors.black,
      ),
      body: Container(
        height: 210,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: color1,
                        decoration: const InputDecoration(
                          hintText: 'Red 0-255',
                        ),
                        onChanged: (String str){
                          // when user type something, change the state of the variable
                          setState(() {
                            int red = int.tryParse(color1.text) ?? 0;
                            int green = int.tryParse(color2.text) ?? 0;
                            int blue = int.tryParse(color3.text) ?? 0;

                            //clamp the value to be within 0-255
                            red = red.clamp(0, 255);
                            green = green.clamp(0, 255);
                            blue = blue.clamp(0, 255);

                            _color = Color.fromARGB(255, red, green, blue);

                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: color2,
                        decoration: const InputDecoration(
                          hintText: 'Green 0-255',
                        ),
                        onChanged: (String str){
                          // when user type something, change the state of the variable
                          setState(() {
                            int red = int.tryParse(color1.text) ?? 0;
                            int green = int.tryParse(color2.text) ?? 0;
                            int blue = int.tryParse(color3.text) ?? 0;

                            //clamp the value to be within 0-255
                            red = red.clamp(0, 255);
                            green = green.clamp(0, 255);
                            blue = blue.clamp(0, 255);

                            _color = Color.fromARGB(255, red, green, blue);
                            
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: color3,
                        decoration: const InputDecoration(
                          hintText: 'Blue 0-255',
                        ),
                        onChanged: (String str){
                          // when user type something, change the state of the variable
                          setState(() {
                            int red = int.tryParse(color1.text) ?? 0;
                            int green = int.tryParse(color2.text) ?? 0;
                            int blue = int.tryParse(color3.text) ?? 0;

                            //clamp the value to be within 0-255
                            red = red.clamp(0, 255);
                            green = green.clamp(0, 255);
                            blue = blue.clamp(0, 255);

                            _color = Color.fromARGB(255, red, green, blue);
                            
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: _color,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),   
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}