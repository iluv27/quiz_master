import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/register/register_widgets.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  String? _email;

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
              'Forgot Password',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const Image(
                    image: AssetImage('images/logo/logo.png'),
                    filterQuality: FilterQuality.high,
                    width: 80,
                    height: 80,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.85,
                    child: const Text(
                      'Please enter your email below to receive your password reset instructions',
                      style: TextStyle(
                          fontSize: 16, color: Color(0xff666666), height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SecondTextFormStyle(
                            heading: 'Enter your Email',
                            label: 'johnsmith@gmail.com',
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
                            height: 50,
                          ),
                          SignupButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                debugPrint('Email: $_email');
                              }
                            },
                            buttonText: 'Send',
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
