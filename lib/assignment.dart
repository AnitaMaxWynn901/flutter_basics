import 'package:flutter/material.dart';

Color bgColor = Color(0xFF202020);
Color primaryColor = Color(0xFFFFBD73);

class Assignment extends StatelessWidget {
  const Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the height of the screen using MediaQuery
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          // Top image section, taking half the screen
            Container(
            height: screenHeight / 2,
            width: double.infinity,
            child: Image.asset(
              'assets/images/baking.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Bottom section containing the form and buttons
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row for 'SIGN IN' and 'SIGN UP'
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sign in'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Sign up'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 100),

                  // Email field
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.alternate_email, color: primaryColor),
                      hintText: 'Email Address',
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),

                  const SizedBox(height: 20),

                  // Password field
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: primaryColor),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),

                  const Spacer(),

                  // Row for icons and the forward button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.android, color: primaryColor),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.message, color: primaryColor),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      // Sign In button (Arrow)
                      FloatingActionButton(
                        backgroundColor: primaryColor,
                        onPressed: () {},
                        shape: const CircleBorder(), 
                        child: Icon(Icons.arrow_forward, color: bgColor),// Ensures it's circular
                        // Set the size of the button
                        mini: true, // Set to true if you want a smaller button
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
