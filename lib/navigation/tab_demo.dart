import 'package:flutter/material.dart';

class TabDemo extends StatelessWidget {
  const TabDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Demo'),
        ),
        bottomNavigationBar: Container(
          color: Colors.black12,
          child: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home), 
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.train), 
                  text: 'Train',
                ),
                Tab(
                  icon: Icon(Icons.directions_bike), 
                  text: 'Bike',
                ),
              ],
            ),
        ),
        body: TabBarView(
          children: [
            // tab 1
            const Text('Welcome'),
            // tab 2 
            Container(
              color: Colors.purple,
              child: const Text('Page 2'),
            ),
            // tab 3 
            Column(
              children: [
                const Text('Page 3'),
                FilledButton(
                onPressed: () {}, 
                child: const Text('Ok'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}