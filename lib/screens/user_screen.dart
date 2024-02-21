import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/settings_screens/support.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';

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
        decoration: BoxDecoration(
            gradient:
                Provider.of<ThemeProvider>(context, listen: false).themeData ==
                        lightMode
                    ? const LinearGradient(colors: [
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 234, 234, 234)
                      ])
                    : const LinearGradient(colors: [
                        Color.fromARGB(255, 0, 0, 0),
                        Color.fromARGB(255, 24, 24, 24),
                        Color.fromARGB(237, 39, 39, 39)
                      ]),
            border: Border(
                bottom: BorderSide(
                    color: Provider.of<ThemeProvider>(context, listen: false)
                                .themeData ==
                            lightMode
                        ? const Color(0xff111111)
                        : const Color.fromARGB(140, 201, 201, 201),
                    width: 0.5))),
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 15, bottom: 10),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const CircleAvatar(
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
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Guest',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text('abcdef@gmail.com',
                          style: Theme.of(context).textTheme.displaySmall)
                    ]),
              ),
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
              const SizedBox(height: 20),
              const RepeatedListTile(
                title: 'Edit Profile',
                icon: Icons.email,
              ),
              const RepeatedListTile(
                title: 'Reset Progress',
                icon: Icons.restart_alt,
              ),
              RepeatedListTile(
                title: 'Support',
                icon: Icons.support,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SupportPage();
                  }));
                },
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
                  title: Provider.of<ThemeProvider>(context, listen: false)
                              .themeData ==
                          lightMode
                      ? 'Light Mode'
                      : 'Dark Mode',
                  icon: Provider.of<ThemeProvider>(context, listen: false)
                              .themeData ==
                          lightMode
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  trailingIcon: const ToggleSwitch()),
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
