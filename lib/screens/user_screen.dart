import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/register/signin_screen.dart';
import 'package:quiz_master/services/supabase_services.dart';
import 'package:quiz_master/settings_screens/app_version.dart';
import 'package:quiz_master/settings_screens/edit_profile.dart';
import 'package:quiz_master/settings_screens/privacy_policy.dart';
import 'package:quiz_master/settings_screens/support.dart';
import 'package:quiz_master/settings_screens/terms.dart';
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
            CircleAvatar(
              radius: 30,
              backgroundColor: Provider.of<AuthProvider>(context, listen: false)
                          .profileImage !=
                      ''
                  ? null
                  : Provider.of<ThemeProvider>(context, listen: false)
                              .themeData ==
                          lightMode
                      ? getRandomColorLight()
                      : getRandomColorDark(),
              child: Provider.of<AuthProvider>(context, listen: false)
                          .profileImage !=
                      ''
                  ? null
                  : Text(
                      Provider.of<AuthProvider>(context, listen: false)
                          .getUserInitials(),
                      style: TextStyle(
                          color:
                              Provider.of<ThemeProvider>(context, listen: false)
                                          .themeData ==
                                      lightMode
                                  ? Colors.white
                                  : const Color(0xff111111),
                          fontSize: 18,
                          letterSpacing: -1,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600),
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
                        Provider.of<AuthProvider>(context, listen: false)
                            .profileName,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                          Provider.of<AuthProvider>(context, listen: false)
                              .profileEmail,
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
              RepeatedListTile(
                title: 'Edit Profile',
                icon: Icons.email,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const EditProfile();
                  }));
                },
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
              RepeatedListTile(
                title: 'Privacy Policy',
                icon: Icons.privacy_tip,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PrivacyScreen();
                  }));
                },
              ),
              RepeatedListTile(
                title: 'Terms of Service',
                icon: Icons.miscellaneous_services,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TermsOfServiceScreen();
                  }));
                },
              ),
              RepeatedListTile(
                title: 'App Version',
                icon: Icons.app_settings_alt,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AppVersionScreen();
                  }));
                },
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
              RepeatedListTile(
                title: 'Log Out',
                icon: Icons.logout,
                trailingIcon: const SizedBox(),
                onPressed: () async {
                  await showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: const EdgeInsets.all(20),
                        titlePadding: const EdgeInsets.only(
                            top: 30, left: 100, right: 100),
                        title: const SizedBox(
                          height: 60,
                          width: 60,
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                        content: const Text(
                          'Logging out...',
                          style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                          ),
                        ],
                      );
                    },
                  );

                  // ignore: use_build_context_synchronously
                  await Provider.of<AuthProvider>(context, listen: false)
                      .signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const SigninScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

Color getRandomColorLight() {
  const List<Color> colors = [
    Color.fromARGB(255, 208, 105, 14),
    Color.fromARGB(255, 209, 106, 15),
    Color.fromARGB(255, 154, 81, 17),
    Color.fromARGB(255, 115, 54, 1),
  ];

  return colors[Random().nextInt(colors.length)];
}

Color getRandomColorDark() {
  const List<Color> colors = [
    Color.fromARGB(255, 255, 160, 77),
    Color.fromARGB(255, 198, 135, 79),
    Color.fromARGB(255, 255, 119, 0),
    Color.fromARGB(255, 228, 146, 75),
  ];

  return colors[Random().nextInt(colors.length)];
}
