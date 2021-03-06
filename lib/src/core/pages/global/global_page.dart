import 'package:flutter/material.dart';
import 'package:isu_chat_system/src/core/pages/main_page.dart';
import 'package:isu_chat_system/src/core/pages/page_flip_builder.dart';

class GlobalPage extends StatelessWidget {
  GlobalPage({Key? key}) : super(key: key);
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Global',
        scaffoldContext: context,
      ),
      body: PageFlipBuilder(
        key: pageFlipKey,
        frontBuilder: (_) => LightHomePage(
          onFlip: () => pageFlipKey.currentState?.flip(),
        ),
        backBuilder: (_) => DarkHomePage(
          onFlip: () => pageFlipKey.currentState?.flip(),
        ),
      ),
    );
  }
}

class LightHomePage extends StatelessWidget {
  const LightHomePage({Key? key, required this.onFlip}) : super(key: key);
  final VoidCallback onFlip;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Front Global'),
    );
  }
}

class DarkHomePage extends StatelessWidget {
  const DarkHomePage({Key? key, required this.onFlip}) : super(key: key);
  final VoidCallback onFlip;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onFlip();
      },
      child: Center(
        child: Text('Back Global'),
      ),
    );
  }
}
