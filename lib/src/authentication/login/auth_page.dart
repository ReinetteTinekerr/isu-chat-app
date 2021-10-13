import 'package:flutter/material.dart';
import 'package:isu_chat_system/src/authentication/auth_state.dart';
import 'package:isu_chat_system/src/authentication/provider/providers.dart';

import 'login_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends AuthState<AuthPage> {
  @override
  void initState() {
    super.initState();
    supabase.auth.onAuthStateChange((event, session) {
      if (session != null) {
        super.onAuthenticated(session);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: const LoginForm(),
    );
  }
}
