import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/register/register_widgets.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  String? password;
  String? confirmPassword;
  bool passwordVisible = false;

  @override
  void dispose() {
    _formKey;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.chevron_left,
                size: 32,
                color:
                    Provider.of<ThemeProvider>(context).themeData == lightMode
                        ? const Color(0xff111111)
                        : Colors.white,
              ),
            ),
            title: Text(
              'Reset Password',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Image(
                    image: AssetImage('images/logo/logo.png'),
                    filterQuality: FilterQuality.high,
                    width: 80,
                    height: 80,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: const Text(
                      'A reset code was sent to your email. Please create a new password',
                      style: TextStyle(
                          fontSize: 16, color: Color(0xff666666), height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SecondTextFormStyle(
                            heading: 'New Password',
                            label: '*****',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your new password';
                              }
                              return '';
                            },
                            onSaved: (value) {
                              password = value;
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
                          const SizedBox(
                            height: 30,
                          ),
                          SecondTextFormStyle(
                            heading: 'Confirm New Password',
                            label: '*****',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please confirm your new password';
                              } else if (value != password) {
                                return 'The password does not match';
                              }
                              return '';
                            },
                            onSaved: (value) {
                              confirmPassword = value;
                            },
                            obscuredText: !passwordVisible,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SignupButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                              }
                            },
                            buttonText: 'Continue',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
