import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_form.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: const LoginForm(),
    );
  }
}
