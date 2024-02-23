import 'package:flutter/material.dart';

class BodyHeadings extends StatelessWidget {
  const BodyHeadings({super.key, required this.heading});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class BodyTexts extends StatelessWidget {
  const BodyTexts({super.key, required this.texts});

  final String texts;

  @override
  Widget build(BuildContext context) {
    return Text(
      texts,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
