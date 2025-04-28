import 'package:flutter/material.dart';

class CookingRecipes extends StatelessWidget {
  const CookingRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cooking Recipes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Papaya Salad',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns the image and text properly
              children: [
                Expanded(
                  flex: 1, // Controls the space allocation for the text
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple),
                    ),
                    child: const Text(
                      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta ducimus in modi illo ad ipsa non officiis. Ea placeat necessitatibus in aliquid ullam quasi porro vel dolores, dignissimos quisquam aspernatur.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2, // Controls the space allocation for the image and icons
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/salad.jpg', // Example path for the local image
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 16), // Space between the image and stars
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.black),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text('3128 reviews'),
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.timer),
                              Text('PREP:'),
                              Text('5 mins'),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.restaurant),
                              Text('COOK:'),
                              Text('10 mins'),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.feed),
                              Text('FEEDS:'),
                              Text('1-3'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
