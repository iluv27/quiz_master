import 'package:flutter/material.dart';
import 'package:quiz_master/register/register_widgets.dart';
import 'package:quiz_master/theme/theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;
  bool passwordVisible = false;
  bool _isCheckboxChecked = false;

  @override
  void dispose() {
    _formKey;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 32,
                      color: Color(0xff111111),
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 55,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButtonWidget(
                          mainLabel: 'Enter full name',
                          subLabel: 'Full Name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return '';
                          },
                          onSaved: (value) {
                            _name = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButtonWidget(
                          mainLabel: 'Enter Email',
                          subLabel: 'Email',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            } else if (value.isEmailValid() == false) {
                              return 'Invalid mail';
                            } else if (value.isEmailValid() == true) {
                              return 'null';
                            }
                            return 'null';
                          },
                          onSaved: (value) {
                            _email = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButtonWidget(
                          mainLabel: 'Enter Password',
                          subLabel: 'Password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password should be more than 6 characters';
                            }
                            return 'null';
                          },
                          obscuredText: !passwordVisible,
                          onSaved: (value) {
                            _password = value;
                          },
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.primary,
                                size: 20,
                              )),
                        ),
                        CheckBoxListTile(
                          text: Text(
                              "I accept the terms and conditions  of Joyhomes",
                              style: Theme.of(context).textTheme.bodySmall),
                          onChanged: (value) {
                            setState(() {
                              _isCheckboxChecked = value ?? false;
                            });
                          },
                        ),
                        const SizedBox(height: 40),
                        SignupButton(
                          onPressed: _isCheckboxChecked
                              ? () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    debugPrint('Name: $_name');
                                    debugPrint('Email: $_email');
                                    debugPrint('Message: $_password');
                                  }
                                }
                              : null,
                          buttonText: 'Get Started',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const OrSign(
                  orSignWith: 'Or Sign up with',
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButtonType(
                        iconsSize: 35,
                        iconImage: 'facebook',
                      ).iconButton(),
                      IconButtonType(iconsSize: 50, iconImage: 'google')
                          .iconButton(),
                      IconButtonType(iconsSize: 35, iconImage: 'twitter')
                          .iconButton(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton(
      {super.key, required this.onPressed, required this.buttonText});
  final String buttonText;
  final Null Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        backgroundColor:
            const MaterialStatePropertyAll<Color>(AppColors.primary),
        minimumSize: MaterialStatePropertyAll(
          Size(MediaQuery.sizeOf(context).width * 1, 50),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isEmailValid() {
    return RegExp(
            r'^[a-zA-Z0-9]+[\_\-\.]*[a-zA-Z0-9]*[@][a-zA-Z0-9]{2,}[\.][a-zA-Z]{2,3}$')
        .hasMatch(this);
  }
}
