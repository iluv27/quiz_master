// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/main.dart';
import 'package:quiz_master/screens/onboarding_screen.dart';
import 'package:quiz_master/services/supabase_services.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Add any initialization or loading tasks here if needed
    _initializeApp();
  }

  void _initializeApp() async {
    // Perform any initialization tasks here
    // For example, initializing Firebase or other services

    // Simulate some delay to show the loading screen for demonstration
    await Future.delayed(const Duration(seconds: 0));

    // Initialization complete, update state to stop showing the loading screen
    setState(() {
      _isLoading = false;
    });

    // Navigate to the main screen after a delay
    _navigateToMainScreen();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (!mounted) {
      return;
    }

    final session = supabase.auth.currentSession;
    if (session != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const SafeArea(child: HomePage())));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const SafeArea(child: OnboardingScreen())));
    }
  }

  void _navigateToMainScreen() async {
    // Add any delay or loading tasks here if needed
    await Future.delayed(const Duration(seconds: 2));
    _redirect();
    // Replace 'MainScreen()' with the widget representing your main app screen
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<ThemeProvider>(context).themeData == darkMode
        ? Scaffold(
            backgroundColor: Colors.white, // White background
            body: Stack(
              children: [
                // Background gradient
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF111111),
                        Color.fromARGB(255, 48, 25, 9)
                      ], // Brown and DarkBrown gradient colors
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                // Logo centered in the screen
                if (_isLoading)
                  const Center(
                    child: LinearProgressIndicator(),
                  )
                else
                  // Show the logo when initialization is complete
                  Center(
                    child: Shimmer.fromColors(
                      loop: 1,
                      baseColor: Colors.white,
                      highlightColor: const Color(0xFFE0781E),
                      child: Image.asset(
                        'images/logo/logodark.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white, // White background
            body: Stack(
              children: [
                // Background gradient
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 234, 234, 234)
                      ], // Brown and DarkBrown gradient colors
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                // Logo centered in the screen
                if (_isLoading)
                  const Center(
                    child: LinearProgressIndicator(),
                  )
                else
                  // Show the logo when initialization is complete
                  Center(
                    child: Shimmer.fromColors(
                      loop: 1,
                      baseColor: const Color(0xFF111111),
                      highlightColor: Colors.white,
                      child: Image.asset(
                        'images/logo/logo2.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
              ],
            ),
          );
  }
}
