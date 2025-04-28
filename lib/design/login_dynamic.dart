// import 'dart:math';
import 'package:flutter/material.dart';

class LoginDynamic extends StatefulWidget {
  const LoginDynamic({super.key});

  @override
  State<LoginDynamic> createState() => _LoginDynamicState();
}

class _LoginDynamicState extends State<LoginDynamic> {
  
  List<Color> darkBgColors = [
    const Color(0xFF0D1441),
    const Color(0xFF283584),
    const Color(0xFF376AB2),
  ];

  List<Color> lightBgColors = [
    const Color(0xFF8C2480),
    const Color(0xFFCE587D),
    const Color(0xFFFF9485),
  ];

  @override
  Widget build(BuildContext context) {
    //find the screen size
    Size size = MediaQuery.sizeOf(context);
    //find the time now
    DateTime now = DateTime.now();
    debugPrint('${now.hour}');
    int time_threshold = 6;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: now.hour < time_threshold ? lightBgColors: darkBgColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        now.hour < time_threshold ? 'Good Morning': 'Good Evening',
                        // style: TextStyle(fontSize: 36),
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                      ),
                      const Text(
                        'Please sign in below',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Username',
                        style: TextStyle(color: Colors.white30),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 2,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ),
                        child: const TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Password',
                        style: TextStyle(color: Colors.white30),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 2,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ),
                        child: const TextField(
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: size.width,
                  child: Image.asset(
                    'assets/images/landscape.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
