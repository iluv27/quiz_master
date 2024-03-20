import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/register/register_widgets.dart';
import 'package:quiz_master/register/signin_screen.dart';
import 'package:quiz_master/register/verify_code.dart';
import 'package:quiz_master/services/supabase_services.dart';
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
  bool _isLoading = false;

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
                        const SizedBox(
                          height: 40,
                        ),
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
                                    return null;
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
                                    }
                                    // else if (value.isEmailValid() == false) {
                                    //   return 'Invalid mail';
                                    // } else if (value.isEmailValid() == true) {
                                    //   return '';
                                    // }
                                    return null;
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
                                    return null;
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
                                  isChecked: _isCheckboxChecked,
                                  text: Text(
                                      'I accept the terms and conditions of Quizmaster',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  onChanged: (value) {
                                    setState(() {
                                      _isCheckboxChecked = value ?? true;
                                    });
                                  },
                                ),
                                const SizedBox(height: 40),
                                _isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Colors.orange,
                                          ),
                                        ),
                                      )
                                    : SignupButton(
                                        onPressed: _isLoading
                                            ? null
                                            : _isCheckboxChecked
                                                ? () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      _formKey.currentState!
                                                          .save();

                                                      debugPrint(
                                                          'Name: $_name');
                                                      debugPrint(
                                                          'Email: $_email');
                                                      debugPrint(
                                                          'Message: $_password');

                                                      setState(() {
                                                        _isLoading = true;
                                                      });

                                                      Provider.of<AuthProvider>(
                                                              context,
                                                              listen: false)
                                                          .signUp(
                                                              _name!,
                                                              _email!,
                                                              _password!);

                                                      setState(() {
                                                        _isLoading = false;
                                                      });

                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                        return VerifyCode(
                                                          email: _email,
                                                          name: _name,
                                                          password: _password,
                                                        );
                                                      }));
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

                //  LOG IN TEXT
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: LastText(
                        main: 'Already have an account? ',
                        sub: 'Log in',
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const SigninScreen();
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
