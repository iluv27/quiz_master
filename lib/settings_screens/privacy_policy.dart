import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';
import 'package:quiz_master/widgets/settings_widgets.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

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
            'Privacy Policy',
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
                    'Privacy Policy for Quiz App',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Last updated: [11/03/2024]',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 20),
                  const BodyHeadings(
                    heading: 'Introduction',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                    texts:
                        'Welcome to Quiz Master App! This privacy policy outlines how we collect, use, disclose, and safeguard your personal information when you use our mobile application.',
                  ),
                  const SizedBox(height: 20),
                  const BodyHeadings(
                    heading: 'Information We Collect',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                    texts:
                        'We collect the following information for the purpose of providing personalized quiz experiences and managing user profiles:',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                    texts: '1. Name',
                  ),
                  const BodyTexts(texts: '2. Email'),
                  const BodyTexts(texts: '3. Profile Picture'),
                  const SizedBox(height: 20),
                  const BodyHeadings(
                    heading: 'How We Use Your Information',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                    texts:
                        'The collected information is used for the following purposes:',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                      texts: '- Personalize and improve user experience'),
                  const BodyTexts(texts: '- Manage user accounts and profiles'),
                  const BodyTexts(texts: '- Communicate with users'),
                  const BodyTexts(
                      texts: '- Provide support and respond to inquiries'),
                  const SizedBox(height: 20),
                  const BodyHeadings(
                    heading: 'Security',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                    texts:
                        'We prioritize the security of your personal information. We implement reasonable measures to safeguard and protect your data against unauthorized access, disclosure, alteration, or destruction.',
                  ),
                  const SizedBox(height: 20),
                  const BodyHeadings(
                    heading: 'Your Choices',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                    texts:
                        'You may choose not to provide certain personal information, but it may limit your ability to use certain features of the app.',
                  ),
                  const SizedBox(height: 20),
                  const BodyHeadings(
                    heading: 'Changes to This Privacy Policy',
                  ),
                  const SizedBox(height: 10),
                  const BodyTexts(
                    texts:
                        'We may update our privacy policy periodically. You are advised to review this policy regularly for any changes.',
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
