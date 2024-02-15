import 'package:flutter/material.dart';

import '../widgets/profile_widgets.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 130,
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
              radius: 30,
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
          child: const Column(
            children: [
              SizedBox(height: 20),
              RepeatedListTile(
                title: 'Edit Profile',
                icon: Icons.email,
              ),
              RepeatedListTile(
                title: 'Reset Progress',
                icon: Icons.restart_alt,
              ),
              RepeatedListTile(
                title: 'Support',
                icon: Icons.support,
              ),
              RepeatedListTile(
                title: 'Privacy Policy',
                icon: Icons.privacy_tip,
              ),
              RepeatedListTile(
                title: 'Terms of Service',
                icon: Icons.miscellaneous_services,
              ),
              RepeatedListTile(
                title: 'App Version',
                icon: Icons.app_settings_alt,
              ),
              RepeatedListTile(
                  title: 'Light Mode',
                  icon: Icons.light_mode,
                  trailingIcon: ToggleSwitch()),
              RepeatedListTile(
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
