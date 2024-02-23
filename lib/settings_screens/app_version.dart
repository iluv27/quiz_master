import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';
import 'package:quiz_master/widgets/settings_widgets.dart';

class AppVersionScreen extends StatelessWidget {
  final String version = "1.0.0";

  const AppVersionScreen(
      {super.key}); // Replace with your actual version number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            size: 32,
            color: Provider.of<ThemeProvider>(context).themeData == lightMode
                ? const Color(0xff111111)
                : Colors.white,
          ),
        ),
        title: Text(
          'App Version',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quizmaster',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'Version $version',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 30),
                const BodyHeadings(
                  heading: 'Key Features:',
                ),
                const SizedBox(height: 10),
                const BodyTexts(
                  texts:
                      '1. Diverse Quiz Options: Take quizzes from a wide range of programming languages, from beginner to advanced levels.',
                ),
                const SizedBox(height: 10),
                const BodyTexts(
                  texts:
                      '2. Quiz History: Track your quiz history to revisit completed quizzes and pick up where you left off.',
                ),
                const SizedBox(height: 10),
                const BodyTexts(
                  texts:
                      '3. Interview Prep (Coming Soon): Get ready for job interviews by practicing real-world coding questions within the app.',
                ),
                const SizedBox(height: 10),
                const BodyTexts(
                  texts:
                      '4. Community Interaction (Coming Soon): Leave comments on quizzes and questions, fostering a collaborative learning environment.',
                ),
                const SizedBox(height: 30),
                const BodyHeadings(
                  heading: 'What\'s New:',
                ),
                const SizedBox(height: 10),
                BodyTexts(
                  texts: 'In version $version, we bring you:',
                ),
                const BodyTexts(
                  texts:
                      '- Exciting new quizzes added regularly to keep your learning journey fresh.',
                ),
                const SizedBox(height: 10),
                const BodyTexts(
                  texts:
                      '- Bug fixes and performance improvements for a smoother experience.',
                ),
                const SizedBox(height: 30),
                const BodyHeadings(
                  heading: 'Upcoming Features:',
                ),
                const SizedBox(height: 10),
                const BodyTexts(
                  texts: 'In our next releases, expect:',
                ),
                const SizedBox(height: 10),
                const BodyTexts(
                  texts:
                      '- Interview questions module for comprehensive job preparation.',
                ),
                const SizedBox(height: 10),
                const BodyTexts(
                  texts:
                      '- Commenting feature to share insights, ask questions, and connect with the Quizmaster community.',
                ),
                const SizedBox(height: 10),
                const BodyTexts(
                  texts:
                      '- Enhanced user analytics for personalized learning recommendations.',
                ),
                const SizedBox(height: 30),
                Text(
                  'Thank you for choosing Quizmaster! We are dedicated to continually improving and providing you with the best learning experience.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: Provider.of<ThemeProvider>(context).themeData ==
                              lightMode
                          ? const Color.fromARGB(175, 17, 17, 17)
                          : const Color.fromARGB(179, 255, 255, 255),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
