import 'package:flutter/material.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool isSwitched = false;

  void _toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: _toggleSwitch,
      activeTrackColor: const Color.fromARGB(86, 224, 120, 30),
      activeColor: const Color(0xFFE0781E),
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
        size: 16,
        color: Color(0xff111111),
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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(29, 224, 120, 30),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Icon(
                icon,
                size: 18,
                color: const Color(0xFFE0781E),
              ),
            ),
            trailing: trailingIcon),
      ),
    );
  }
}
