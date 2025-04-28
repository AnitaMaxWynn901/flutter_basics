import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Header',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.red,),
            ),
            Text(
              'Header',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.red,),
            ),
            Text(
              'Body',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const FilledButton(
              onPressed: null,
              child: Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}
