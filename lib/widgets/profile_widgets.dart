import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/theme/provider.dart';

import '../theme/theme.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool isSwitched = true;

  void _toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: _toggleSwitch,
      activeTrackColor: const Color.fromARGB(86, 224, 120, 30),
      activeColor: AppColors.primary,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      splashRadius: 10, // Reduces the tap target size
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  const RepeatedListTile(
      {super.key,
      required this.title,
      required this.icon,
      this.onPressed,
      this.trailingIcon = const Icon(
        Icons.arrow_forward_ios,
      )});

  final String title;
  final IconData icon;
  final Function()? onPressed;
  final Widget trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: onPressed,
        child: ListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color:
                      Provider.of<ThemeProvider>(context).themeData == lightMode
                          ? const Color.fromARGB(29, 224, 120, 30)
                          : const Color.fromARGB(52, 224, 120, 30),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Icon(
                icon,
                size: 18,
                color: AppColors.primary,
              ),
            ),
            trailing: trailingIcon),
      ),
    );
  }
}
