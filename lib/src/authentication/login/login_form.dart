import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isu_chat_system/src/authentication/provider/providers.dart';

class UserFullNameData {
  String firstName = '';
  String middleName = '';
  String lastName = '';
}

enum Gender { male, female, none }
enum Occupation { student, faculty }

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  Gender? _gender = Gender.none;
  Occupation dropdownValue = Occupation.student;

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
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
              textFormBuilder(labelText: 'Email', iconData: Icons.email),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      showSignUpFormBottomSheet(context);
                    },
                    child: const Text('Sign Up'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(authUserNotifierProvider.notifier).signIn();
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

  PersistentBottomSheetController<void> showSignUpFormBottomSheet(
    BuildContext context,
  ) {
    final _email = TextEditingController();
    final _fullName = UserFullNameData();
    final _formKey = GlobalKey<FormState>();
    bool isSubmitting = false;

    return showBottomSheet<void>(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
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
                            step1(_fullName, _email),
                            step2(setState),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: isSubmitting
                                ? null
                                : () {
                                    if (_gender == Gender.none) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Please choose a gender',
                                          ),
                                        ),
                                      );
                                    }
                                    if (_formKey.currentState?.validate() ==
                                            true &&
                                        _gender != Gender.none) {
                                      setState(() => isSubmitting = true);
                                    }
                                  },
                            child:
                                Text(isSubmitting ? 'Signing In' : 'Sign In'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Step step1(UserFullNameData _fullName, TextEditingController _email) {
    return Step(
      title: const Text('Step 1'),
      isActive: _index >= 0,
      // state: _index >= 1
      //     ? StepState.complete
      //     : StepState.disabled,
      content: Column(
        children: [
          const SizedBox(height: 5),
          textFormBuilder(
            labelText: 'First name',
            onChanged: (value) => _fullName.firstName = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your first name';
              }
            },
          ),
          const SizedBox(height: 10),
          textFormBuilder(
            labelText: 'Middle name',
            onChanged: (value) => _fullName.middleName = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your middle name';
              }
            },
          ),
          const SizedBox(height: 10),
          textFormBuilder(
            labelText: 'Last name',
            onChanged: (value) => _fullName.lastName = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your last name';
              }
            },
          ),
          const SizedBox(height: 10),
          textFormBuilder(
            labelText: 'Email',
            controller: _email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your email address';
              }
              if (!EmailValidator.validate(value)) {
                return 'Invalid email address';
              }
            },
          ),
        ],
      ),
    );
  }

  Step step2(StateSetter setState) {
    return Step(
      title: const Text('Step 2'),
      isActive: _index == 1,
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
              value: dropdownValue,
              // style: const TextStyle(fontSize: 18),
              onChanged: (Occupation? newValue) {
                setState(
                  () => dropdownValue = newValue!,
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
        title: Text(title),
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

  TextFormField textFormBuilder({
    required String labelText,
    IconData? iconData,
    TextEditingController? controller,
    ValueChanged? onChanged,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
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
