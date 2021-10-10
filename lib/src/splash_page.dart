import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Center(
          child: SizedBox(
            width: size.width * 0.5,
            child: Image.asset(
              'assets/icon/icon.png',
              width: 128,
              height: 128,
            ),
          ),
        ),
      ),
    );
  }
}
