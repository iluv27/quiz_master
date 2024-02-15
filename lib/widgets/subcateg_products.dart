import 'package:flutter/material.dart';

class SubCategProducts extends StatelessWidget {
  const SubCategProducts(
      {super.key, required this.maincategName, required this.subcategName});

  final String maincategName;
  final String subcategName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.5,
          title: Text('data'),
        ),
        body: Center(
          child: Text(maincategName),
        ));
  }
}
