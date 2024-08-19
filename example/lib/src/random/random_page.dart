import 'package:example/src/random/random_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class RandomPage extends StatelessWidget {
  const RandomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.get<RandomController>().title),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/Random/Page2');
            },
            child: const Text('Random Page2 ')),
      ),
    );
  }
}
