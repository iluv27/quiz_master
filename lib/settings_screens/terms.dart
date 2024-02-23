import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';
import 'package:quiz_master/widgets/settings_widgets.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            'Terms of Service',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terms of Service for Quizmaster App',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Last updated: 11/03/2024',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 20),
                  const BodyHeadings(
                    heading: 'Acceptance of Terms',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                    texts:
                        'By using the Quizmaster App, you agree to comply with and be bound by these terms of service. If you do not agree to these terms, please do not use the app.',
                  ),
                  const SizedBox(height: 20),
                  const BodyHeadings(
                    heading: 'User Accounts',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                    texts:
                        '1. You must provide accurate and complete information when creating an account on Quizmaster App.',
                  ),
                  const BodyTexts(
                    texts:
                        '2. You are responsible for maintaining the confidentiality of your account credentials.',
                  ),
                  const BodyTexts(
                    texts:
                        '3. You agree not to share your account credentials with others or allow unauthorized access to your account.',
                  ),
                  const SizedBox(height: 20),
                  const BodyHeadings(
                    heading: 'Content and Use',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                    texts:
                        '1. The content provided in Quizmaster App, including quizzes and questions, is for informational and entertainment purposes only.',
                  ),
                  const BodyTexts(
                    texts:
                        '2. You may not use the app for any illegal or unauthorized purpose.',
                  ),
                  const BodyTexts(
                    texts:
                        '3. You agree not to interfere with the proper functioning of the app.',
                  ),
                  const SizedBox(height: 20),
                  const BodyHeadings(
                    heading: 'Termination',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                    texts:
                        'We reserve the right to terminate or suspend your account and access to the app at our sole discretion, without prior notice, for any reason, including a breach of these terms.',
                  ),
                  const SizedBox(height: 20),
                  const BodyHeadings(
                    heading: 'Changes to Terms',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                    texts:
                        'We may update these terms periodically. You are advised to review this agreement regularly for any changes.',
                  ),
                  const SizedBox(height: 20),
                  const BodyHeadings(
                    heading: 'Contact Us',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                    texts:
                        'If you have any questions or concerns about these terms, please contact us at info@quizmaster.com',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
