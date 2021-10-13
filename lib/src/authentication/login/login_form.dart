import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isu_chat_system/src/authentication/login/sign_up_form.dart';
import 'package:isu_chat_system/src/authentication/provider/providers.dart';
import 'package:isu_chat_system/src/constants.dart';
import 'package:supabase/supabase.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signIn() async {
    final response = await supabase.auth.signIn(
      email: _emailController.text,
      password: _passwordController.text,
      options: AuthOptions(
        redirectTo:
            kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
      ),
    );
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    } else {
      // context.showSnackBar(message: 'Check your email for login link!');
      _emailController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Center(
        child: Container(
          width: size.width * 0.7,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_pin,
                size: 130,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              const Text(
                'Log In',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              TextFormBuilder(
                labelText: 'Email',
                controller: _emailController,
                iconData: Icons.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your email address';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Invalid email address';
                  }
                },
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              TextFormBuilder(
                labelText: 'Password',
                controller: _passwordController,
                iconData: Icons.vpn_key,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your password';
                  }
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      showBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: Theme.of(context).primaryColorDark,
                            width: 0.2,
                          ),
                        ),
                        context: context,
                        builder: (context) => const SignUpForm(),
                      );
                    },
                    child: const Text('Sign Up'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        _signIn();
                      }
                    },
                    child: const Text('Log In'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
