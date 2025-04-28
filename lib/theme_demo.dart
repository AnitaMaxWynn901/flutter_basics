import 'package:flutter/material.dart';


class ThemeDemo extends StatefulWidget {
  const ThemeDemo({super.key});

  @override
  State<ThemeDemo> createState() => _ThemeDemoState();
}

class _ThemeDemoState extends State<ThemeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme Demo',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
          backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Text'),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Text input',
              ),
            ),
            ElevatedButton(
              onPressed: () {}, 
              child: const Text(
                'Button'
              ),
            ),
            FilledButton(
              onPressed: () {}, 
              child: const Text('Button',
              ),
            ),
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
              child: const Text('Error',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          onPressed: () {}, 
          child: Icon(
            Icons.add, 
            color: Theme.of(context).colorScheme.primaryContainer,
        ),
    ),
    );
  }
}