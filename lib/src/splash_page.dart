import 'package:flutter/material.dart';
import 'package:isu_chat_system/src/authentication/auth_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends AuthState<SplashPage> {
  @override
  void initState() {
    recoverSupabaseSession();
    super.initState();
  }

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
