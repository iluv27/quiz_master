import 'package:flutter/material.dart';

import '../questions/quiz_sect.dart';
import '../utilities/categ_list.dart';
import '../widgets/categ_widgets.dart';

class AngularQuiz extends StatefulWidget {
  const AngularQuiz({super.key});

  @override
  State<AngularQuiz> createState() => _AngularQuizState();
}

class _AngularQuizState extends State<AngularQuiz> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategHeaderLabel(
            headerLabel: 'Angular.js',
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.63,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  itemCount: angular.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 10,
                      crossAxisCount:
                          2, // You can adjust the number of columns here

                      childAspectRatio: 0.85),
                  itemBuilder: (context, index) {
                    return SubcategModel(
                      mainCategName: 'Angular.js',
                      subCategName: angular[index],
                      questionTotal: htmlQuestions.length,
                      assetName: 'images/quizzes_cat/angular/angular$index.png',
                      subCategLabel: angular[index],
                      categColor: colors[index],
                    );
                  }))
        ],
      ),
    );
  }
}

List<Color> colors = const [
  Color.fromARGB(255, 255, 227, 227),
  Color.fromARGB(255, 255, 255, 217),
  Color.fromARGB(255, 235, 255, 231),
  Color.fromARGB(255, 227, 245, 252),
  Color.fromARGB(255, 255, 240, 221),
  Color(0xffffefff),
  Color(0xffafffff),
  Color(0xffffcfff),
  Color(0xffffcfff),
  Color.fromARGB(255, 207, 214, 255),
  Color.fromARGB(255, 255, 227, 227),
  Color.fromARGB(255, 255, 255, 217),
  Color.fromARGB(255, 235, 255, 231),
  Color.fromARGB(255, 227, 245, 252),
  Color.fromARGB(255, 255, 240, 221),
  Color(0xffffefff),
];
