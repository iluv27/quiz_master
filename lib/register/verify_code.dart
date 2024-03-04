import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/register/register_widgets.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final _formKey = GlobalKey<FormState>();
  String? code;

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
              'Verify Code',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
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
                      'Reset code was sent to your email. Please enter the code.',
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
                          Center(
                              child: SizedBox(
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 11,
                                        right: 0,
                                        child: SizedBox(
                                          height: 60,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            cursorWidth: 1.5,
                                            cursorHeight: 60,
                                            cursorColor: AppColors.primary,
                                            obscureText: true,
                                            style: const TextStyle(
                                              color: Color(0xff111111),
                                              letterSpacing: 30,
                                              fontSize: 60,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            decoration: InputDecoration(
                                                suffixIconConstraints:
                                                    BoxConstraints.tight(
                                                        const Size(30, 30)),
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                hintText: '0000',
                                                hintStyle: const TextStyle(
                                                  fontSize: 60,
                                                  letterSpacing: 20,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xAB666666),
                                                ),
                                                helperStyle: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff111111)),
                                                border: InputBorder.none),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter the code';
                                              }
                                              return '';
                                            },
                                            onSaved: (value) {
                                              code = value;
                                            },
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        child: CustomPaint(
                                            painter: DashedLinePainter(),
                                            child: SizedBox(
                                              height: 5,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                            )),
                                      ),
                                    ],
                                  ))),
                          const SizedBox(
                            height: 60,
                          ),
                          SignupButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                debugPrint('Code: $code');
                              }
                            },
                            buttonText: 'Submit Code',
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

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    double dashWidth = 50.0;
    double dashSpace = 13.0;
    double startY = size.height / 2;

    double currentX = 0;
    while (currentX < size.width) {
      canvas.drawLine(Offset(currentX, startY),
          Offset(currentX + dashWidth, startY), paint);
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}