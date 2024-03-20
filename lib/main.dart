import 'package:flutter/material.dart';
import 'package:quiz_master/screens/home_screen.dart';
import 'package:quiz_master/services/supabase_services.dart';
import 'package:quiz_master/splash_screen.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:quiz_master/screens/history_screen.dart';
import 'package:quiz_master/screens/user_screen.dart';
import 'package:quiz_master/theme/theme.dart';
import 'screens/quiz_screen.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const SplashScreen(),
    );
  }
}

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
          decoration: BoxDecoration(
            color:
                Provider.of<ThemeProvider>(context, listen: false).themeData ==
                        lightMode
                    ? Colors.white
                    : const Color(0xff111111),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Provider.of<ThemeProvider>(context, listen: false)
                            .themeData ==
                        lightMode
                    ? const Color.fromARGB(17, 27, 27, 27)
                    : const Color.fromARGB(42, 128, 128, 128),
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
                rippleColor: Provider.of<ThemeProvider>(context, listen: false)
                            .themeData ==
                        lightMode
                    ? Colors.grey[300]!
                    : const Color.fromARGB(255, 59, 59, 59),
                gap: 5,
                activeColor: const Color.fromARGB(255, 255, 255, 255),
                iconSize: Provider.of<ThemeProvider>(context, listen: false)
                            .themeData ==
                        lightMode
                    ? 25
                    : 22,
                duration: const Duration(milliseconds: 200),
                tabBackgroundColor: AppColors.primary,
                backgroundColor:
                    Provider.of<ThemeProvider>(context, listen: false)
                                .themeData ==
                            lightMode
                        ? Colors.white
                        : const Color(0xff111111),
                color: Provider.of<ThemeProvider>(context, listen: false)
                            .themeData ==
                        lightMode
                    ? const Color(0xff444444)
                    : const Color.fromARGB(255, 206, 206, 206),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.logo_dev,
                    text: 'Quizzes',
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
