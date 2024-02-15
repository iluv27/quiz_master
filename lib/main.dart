import 'package:flutter/material.dart';
import 'package:quiz_master/screens/home_screen.dart';
import 'package:quiz_master/theme.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:quiz_master/screens/history_screen.dart';
import 'package:quiz_master/screens/user_screen.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightMode,
      darkTheme: darkMode,
      home: const HomePage(),
    );
  }
}

//Theme.of(context).colorScheme.background,

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedScreen = 0;
  List screens = const [
    HomeScreen(),
    QuizScreen(),
    HistoryScreen(),
    UserScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[selectedScreen],
        backgroundColor: Theme.of(context).colorScheme.background,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color.fromARGB(17, 27, 27, 27),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                selectedIndex: selectedScreen,
                onTabChange: (value) {
                  setState(() {
                    selectedScreen = value;
                  });
                },
                padding: const EdgeInsets.all(15),
                rippleColor: Colors.grey[300]!,
                gap: 5,
                activeColor: const Color.fromARGB(255, 255, 255, 255),
                iconSize: 25,
                duration: const Duration(milliseconds: 200),
                tabBackgroundColor: const Color(0xFFE0781E),
                backgroundColor: Colors.white,
                color: const Color(0xff444444),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.logo_dev,
                    text: 'Quizes',
                  ),
                  GButton(
                    icon: Icons.hive_sharp,
                    text: 'History',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
