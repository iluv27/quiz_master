import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiz_master/theme/theme.dart';

//Button for the signup and log in pages
class IconButtonType {
  String? iconImage;
  double? iconsSize;
  Function()? iconFunction;
  IconButton iconButton() {
    return IconButton(
      iconSize: iconsSize,
      onPressed: (iconFunction),
      icon: Image.asset('images/icons/$iconImage.png'),
    );
  }

  IconButtonType({this.iconImage, this.iconsSize, this.iconFunction});
}

// THIS IS THE OR-SIGN-WITH WIDGET
class OrSign extends StatelessWidget {
  const OrSign({
    super.key,
    required this.orSignWith,
  });

  final String orSignWith;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 23,
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: 0.5,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withOpacity(0.4)
              : AppColors.bgDark.withOpacity(0.3),
        ),
      ),
      Align(
        alignment: AlignmentDirectional.center,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Container(
            padding: const EdgeInsets.all(15),
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.bgDark.withOpacity(1)
                : Colors.white,
            child: Text(orSignWith,
                style: Theme.of(context).textTheme.displaySmall),
          ),
        ),
      ),
    ]);
  }
}

// THIS IS THE TEXTBUTTONS WIDGET
class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
      {super.key,
      required this.mainLabel,
      required this.subLabel,
      required this.validator,
      required this.onSaved,
      this.suffixIcon,
      this.obscuredText = false});

  final String mainLabel;
  final String subLabel;
  final Function(String?) onSaved;
  final String? Function(dynamic)? validator;
  final Widget? suffixIcon;
  final bool obscuredText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorWidth: 1.5,
      cursorHeight: 20,
      cursorColor: AppColors.primary,
      obscureText: obscuredText,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconConstraints: BoxConstraints.tight(const Size(30, 30)),
          contentPadding: const EdgeInsets.only(left: 15),
          hintText: mainLabel,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0xAB666666),
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          helperText: subLabel,
          helperStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff111111))),
      validator: validator,
      onChanged: onSaved,
    );
  }
}

// This is the 'already have an account' TEXT
class LastText extends StatelessWidget {
  const LastText(
      {super.key, required this.main, required this.sub, required this.onTap});

  final String main;
  final String sub;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: main,
        style: Theme.of(context).textTheme.displaySmall,
        children: [
          TextSpan(
            text: sub,
            style: const TextStyle(color: AppColors.primary, fontSize: 14),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}

// THIS IS THE REMEMBER ME CHECK BOX
// ignore: must_be_immutable
class CheckBoxListTile extends StatefulWidget {
  CheckBoxListTile(
      {super.key,
      required this.text,
      required this.onChanged,
      required this.isChecked});
  final Widget? text;
  final ValueChanged<bool?> onChanged;
  bool? isChecked;
  @override
  State<CheckBoxListTile> createState() => _CheckBoxListTileState();
}

class _CheckBoxListTileState extends State<CheckBoxListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: AppColors.primary,
      checkColor: Colors.white,
      side: BorderSide(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : AppColors.bgDark),
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      selected: true,
      value: widget.isChecked,
      onChanged: (bool? value) {
        setState(() {
          widget.isChecked = value;
        });

        widget.onChanged(value);
      },
      title: widget.text,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

// SIGN UP BUTTON
class SignupButton extends StatelessWidget {
  const SignupButton(
      {super.key, required this.onPressed, required this.buttonText});
  final String buttonText;
  final Null Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: AppColors.primary,
      disabledColor: const Color.fromARGB(156, 224, 120, 30),
      minWidth: MediaQuery.sizeOf(context).width * 1,
      height: 50,
      child: Text(
        buttonText,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}

// ANOTHER TYPE OF TEXTFORM FIELD
class SecondTextFormStyle extends StatelessWidget {
  const SecondTextFormStyle(
      {super.key,
      required this.heading,
      required this.label,
      this.suffixIcon,
      this.validator,
      required this.onSaved,
      this.obscuredText = false});

  final String heading;
  final String label;
  final String Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscuredText;
  final Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(
              color: Color(0xff111111),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          cursorWidth: 1.5,
          cursorHeight: 20,
          cursorColor: AppColors.primary,
          obscureText: obscuredText,
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              suffixIconConstraints: BoxConstraints.tight(const Size(30, 30)),
              contentPadding: const EdgeInsets.only(left: 15),
              hintText: label,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xAB666666),
              ),
              helperStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff111111))),
          validator: validator,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
