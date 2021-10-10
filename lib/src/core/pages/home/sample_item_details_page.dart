import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsPage extends StatefulWidget {
  const SampleItemDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<SampleItemDetailsPage> createState() => _SampleItemDetailsPageState();
}

class _SampleItemDetailsPageState extends State<SampleItemDetailsPage> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(seconds: 5),
                child: const Text(
                  'Ano na ay...',
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _visible = !_visible;
              }),
              child: const Text('Tap me!'),
            )
          ],
        ),
      ),
    );
  }
}
