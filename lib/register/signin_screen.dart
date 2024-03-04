import 'package:flutter/material.dart';
import 'package:quiz_master/register/forgot_password.dart';
import 'package:quiz_master/register/register_widgets.dart';
import 'package:quiz_master/register/signup_screen.dart';
import 'package:quiz_master/theme/theme.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  bool passwordVisible = false;
  bool _isCheckboxChecked = true;

  @override
  void dispose() {
    _formKey;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  right: 0,
                  left: 0,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage('images/logo/logo.png'),
                          filterQuality: FilterQuality.high,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Welcome Back',
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
                                  mainLabel: 'Enter Email',
                                  subLabel: 'Email',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return '';
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
                                    return '';
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
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: CheckBoxListTile(
                                          isChecked: _isCheckboxChecked,
                                          text: Text('Remember me',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                          onChanged: (value) {
                                            setState(() {
                                              _isCheckboxChecked =
                                                  value ?? false;
                                            });
                                          },
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const ForgotPassword();
                                          }));
                                        },
                                        child: const Text('Forgot Password?',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    205, 224, 120, 30),
                                                fontSize: 12)),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 40),
                                SignupButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();

                                      debugPrint('Email: $_email');
                                      debugPrint('Message: $_password');
                                    }
                                  },
                                  buttonText: 'Sign in',
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const OrSign(
                          orSignWith: 'Or Sign in with',
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
                              IconButtonType(
                                      iconsSize: 35, iconImage: 'twitter')
                                  .iconButton(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: LastText(
                        main: 'Don\'t have an account? ',
                        sub: 'Sign up',
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const SignupScreen();
                          }));
                        },
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
