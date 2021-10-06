import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: const Center(
        child: Text('Empty'),
      ),
    );
  }
}
