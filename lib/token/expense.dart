import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense'),
        actions: [
          const Text('username'),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_off),
          ),
        ],
      ),
    );
  }
}
