import 'package:flutter/material.dart';

class ListviewDemo extends StatelessWidget {
  ListviewDemo({super.key});

  final List products = [
    {'icon': Icons.home, 'name': 'home', 'price': 100},
    {'icon': Icons.phone, 'name': 'phone', 'price': 499},
    {'icon': Icons.cabin, 'name': 'cabin', 'price': 499},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(products[index]['icon']),
                title: Text(products[index]['name']),
                subtitle: Text('${products[index]['price']} baht'),
                trailing: const Icon(Icons.add),
              );
            },),
      ),
    );
  }
}
