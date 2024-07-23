import 'package:example/src/detail/detail_controller.dart';
import 'package:flutter/material.dart';

import 'widget/form_item.dart';

class DetailPage extends StatelessWidget {
  final DetailController controller;

  const DetailPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home detail'),
      ),
      body: Center(
        child: Column(
          children: [
            const FormItem(
              id: 'FormItem1',
            ),
            const Divider(),
            const FormItem(
              id: 'FormItem2',
            ),
            const Divider(),
            const FormItem(
              id: 'FormItem3',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed('/Detail/DetailSuper');
              },
              child: const Text('Detail Super'),
            ),
          ],
        ),
      ),
    );
  }
}
