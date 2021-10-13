import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isu_chat_system/src/authentication/auth_state.dart';
import 'package:isu_chat_system/src/authentication/provider/providers.dart';
import 'package:isu_chat_system/src/constants.dart';
import 'package:supabase/supabase.dart';

class UserFullNameData {
  String firstName = '';
  String middleName = '';
  String lastName = '';
}

enum Gender { male, female, none }
enum Occupation { student, faculty }

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullName = UserFullNameData();
  bool _isLoading = false;
  int _index = 0;
  Gender? _gender = Gender.none;
  Occupation _dropdownValue = Occupation.student;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 25),
          const Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          // const SizedBox(height: 10),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Stepper(
                  controlsBuilder: (
                    BuildContext context, {
                    VoidCallback? onStepContinue,
                    VoidCallback? onStepCancel,
                  }) {
                    return Row(
                      children: <Widget>[
                        OutlinedButton(
                          onPressed: _index >= 1 ? null : onStepContinue,
                          child: const Text('NEXT'),
                        ),
                        TextButton(
                          onPressed: _index <= 0 ? null : onStepCancel,
                          child: const Text('BACK'),
                        ),
                      ],
                    );
                  },
                  type: StepperType.vertical,
                  currentStep: _index,
                  onStepCancel: () {
                    if (_index > 0) setState(() => _index -= 1);
                  },
                  onStepContinue: () {
                    if (_index <= 0) setState(() => _index += 1);
                  },
                  onStepTapped: (int index) {
                    setState(() => _index = index);
                  },
                  steps: <Step>[
                    step1(),
                    step2(),
                    step3(),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () {
                            if (_gender == Gender.none) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please choose a gender',
                                  ),
                                ),
                              );
                            }
                            if (_formKey.currentState?.validate() == true &&
                                _gender != Gender.none) {
                              _signIn();
                              //   ref
                              //       .watch(authUserNotifierProvider.notifier)
                              //       .signIn(context, _emailController);
                            }
                          },
                    child: Text(_isLoading ? 'Signing In' : 'Sign In'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    final response = await supabase.auth.signUp(
      _emailController.text,
      'test123',
      options: AuthOptions(
        redirectTo:
            kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
      ),
    );
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    } else {
      context.showSnackBar(message: 'Check your email for login link!');
      _emailController.clear();
    }

    setState(() {
      _isLoading = false;
    });
  }

  Step step1() {
    return Step(
      title: const Text('Step 1'),
      isActive: _index >= 0,
      // state: _index >= 1
      //     ? StepState.complete
      //     : StepState.disabled,
      content: Column(
        children: [
          const SizedBox(height: 5),
          TextFormBuilder(
            labelText: 'First name',
            onChanged: (value) => _fullName.firstName = value,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your first name';
              }
            },
          ),
          const SizedBox(height: 10),
          TextFormBuilder(
            labelText: 'Middle name',
            onChanged: (value) => _fullName.middleName = value,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your middle name';
              }
            },
          ),
          const SizedBox(height: 10),
          TextFormBuilder(
            labelText: 'Last name',
            onChanged: (value) => _fullName.lastName = value,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your last name';
              }
            },
          ),
          const SizedBox(height: 10),
          TextFormBuilder(
            labelText: 'Email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your email address';
              }
              if (!EmailValidator.validate(value)) {
                return 'Invalid email address';
              }
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Step step2() {
    return Step(
      title: const Text('Step 2'),
      isActive: _index >= 1,
      // state: _index >= 1
      //     ? StepState.complete
      //     : StepState.disabled,
      content: Column(
        children: [
          const SizedBox(height: 10),
          TextFormBuilder(
            labelText: 'Email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your email address';
              }
              if (!EmailValidator.validate(value)) {
                return 'Invalid email address';
              }
            },
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
              if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
            },
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Step step3() {
    return Step(
      title: const Text('Step 2'),
      isActive: _index == 2,
      content: Column(
        children: <Widget>[
          headTextBuilder(labelText: 'Gender'),
          Row(
            children: [
              radioButtonBuilder(
                setState,
                Gender.male.toCapitalize(),
                Gender.male,
                _gender,
              ),
              radioButtonBuilder(
                setState,
                Gender.female.toCapitalize(),
                Gender.female,
                _gender,
              ),
            ],
          ),
          const Divider(),
          headTextBuilder(labelText: 'Level'),
          const SizedBox(width: 10),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 25),
            child: DropdownButton(
              value: _dropdownValue,
              // style: const TextStyle(fontSize: 18),
              onChanged: (Occupation? newValue) {
                setState(
                  () => _dropdownValue = newValue!,
                );
              },
              items: Occupation.values
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(
                        value.toCapitalize(),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Container headTextBuilder({required String labelText}) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        labelText,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Expanded radioButtonBuilder(
    StateSetter setState,
    String title,
    Gender value,
    Gender? groupValue,
  ) {
    return Expanded(
      child: ListTile(
        title: TextButton(
          child: Text(title),
          onPressed: () => setState(() => _gender = value),
        ),
        leading: Radio<Gender>(
          value: value,
          groupValue: groupValue,
          onChanged: (Gender? value) {
            setState(() {
              _gender = value;
            });
          },
        ),
      ),
    );
  }
}

class TextFormBuilder extends StatelessWidget {
  const TextFormBuilder({
    Key? key,
    required this.labelText,
    this.iconData,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  final String labelText;
  final IconData? iconData;
  final TextEditingController? controller;
  final ValueChanged? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: iconData == null
          ? InputDecoration(
              labelText: labelText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            )
          : InputDecoration(
              labelText: labelText,
              prefixIcon: Icon(iconData),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
      validator: validator,
    );
  }
}

extension ParseToString on Enum {
  String toShortString() {
    return toString().split('.').last;
  }

  String toCapitalize() {
    String text = toShortString();
    return '${text[0].toUpperCase()}${text.substring(1)}';
  }
}
