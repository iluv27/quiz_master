import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.85,
      child: const Text.rich(
          textAlign: TextAlign.center,
          maxLines: 2,
          TextSpan(
              style: TextStyle(
                  height: 1.7,
                  fontSize: 16,
                  color: Color.fromARGB(199, 17, 17, 17)),
              children: [
                TextSpan(
                    text: 'You need to be logged in to save your history. '),
                TextSpan(
                    text: 'Log in.', style: TextStyle(color: Color(0xFFE0781E)))
              ])),
    ));
  }
}
