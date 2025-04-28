import 'package:flutter/material.dart';

class TouristPlace extends StatelessWidget {
  const TouristPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tourist Place',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
          children: [
            // Image section
            Image.asset(
              'assets/images/clock-tower.jpg',
            ),
            const SizedBox(height: 10),
            // Title, location, and rating section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chiang Rai Clock Tower',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Rating section with star and number
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '559',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Chiang Rai, Thailand',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Row with call, route, share buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.call, color: Colors.blue),
                            onPressed: () {
                              // Logic to call
                            },
                          ),
                          const Text(
                            'CALL',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.near_me, color: Colors.blue),
                            onPressed: () {
                              // Logic to navigate
                            },
                          ),
                          const Text(
                            'ROUTE',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.share, color: Colors.blue),
                            onPressed: () {
                              // Logic to share
                            },
                          ),
                          const Text(
                            'SHARE',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Description text
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Excepturi sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
      ),
    );
  }
}
