import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isu_chat_system/src/authentication/create_user/login_form.dart';
import 'package:isu_chat_system/src/authentication/create_user/sign_up_form.dart';
import 'package:isu_chat_system/src/authentication/provider/providers.dart';
import 'package:isu_chat_system/src/constants.dart';

class CreateUserPage extends ConsumerWidget {
  CreateUserPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    watch(createUserNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Create User'),
      ),
      body: SignUpPage(),
    );
  }
}
