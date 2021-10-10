import 'package:flutter/material.dart';

class GradesPage extends StatelessWidget {
  const GradesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grades'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: const Center(
        child: Text('Your grades'),
      ),
    );
  }
}
