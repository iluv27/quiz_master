import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<bool> _selections = [false, true];
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 120,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 234, 234, 234)
            ]),
            border: Border(
                bottom: BorderSide(color: Color(0xff111111), width: 0.5))),
        child: const Padding(
          padding: EdgeInsets.only(left: 30.0, top: 15, bottom: 10),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
              // backgroundImage: AssetImage('images/css.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: SizedBox(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      'Guest',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff111111),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text('abcdef@gmail.com',
                        style: TextStyle(
                            color: Color.fromARGB(185, 59, 59, 59),
                            fontSize: 14))
                  ])),
            )
          ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const RepeatedListTile(
                title: 'Edit Profile',
                icon: Icons.email,
              ),
              const RepeatedListTile(
                title: 'Reset Progress',
                icon: Icons.restart_alt,
              ),
              const RepeatedListTile(
                title: 'Support',
                icon: Icons.support,
              ),
              const RepeatedListTile(
                title: 'Privacy Policy',
                icon: Icons.privacy_tip,
              ),
              const RepeatedListTile(
                title: 'Terms of Service',
                icon: Icons.miscellaneous_services,
              ),
              const RepeatedListTile(
                title: 'App Version',
                icon: Icons.app_settings_alt,
              ),
              RepeatedListTile(
                  title: 'Light Mode',
                  icon: Icons.light_mode,
                  trailingIcon: ToggleSwitch()),
              const RepeatedListTile(
                title: 'Log Out',
                icon: Icons.logout,
                trailingIcon: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

class ToggleSwitch extends StatefulWidget {
  @override
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
