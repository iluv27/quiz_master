import 'package:flutter/material.dart';
import '../questions/quiz_sect.dart';
import '../utilities/categ_list.dart';
import '../widgets/categ_widgets.dart';

List<Color> colors = const [
  Color.fromARGB(255, 227, 255, 242),
  Color.fromARGB(255, 232, 217, 255),
  Color.fromARGB(255, 255, 244, 231),
  Color.fromARGB(255, 252, 227, 246),
  Color.fromARGB(255, 255, 240, 221),
  Color(0xffffefff),
  Color(0xffafffff),
  Color(0xffffcfff),
  Color(0xffffcfff),
  Color.fromARGB(255, 207, 214, 255),
  Color.fromARGB(255, 255, 240, 221),
  Color(0xffffefff),
  Color(0xffafffff),
  Color(0xffffcfff),
  Color(0xffffcfff),
  Color.fromARGB(255, 207, 214, 255),
];

class JavascriptQuiz extends StatefulWidget {
  const JavascriptQuiz({super.key});

  @override
  State<JavascriptQuiz> createState() => _JavascriptQuizState();
}

class _JavascriptQuizState extends State<JavascriptQuiz> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CategHeaderLabel(
            headerLabel: 'JAVASCRIPT',
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.63,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  itemCount: javascript.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 10,
                      crossAxisCount:
                          2, // You can adjust the number of columns here

                      childAspectRatio: 0.85),
                  itemBuilder: (context, index) {
                    return SubcategModel(
                      mainCategName: 'JAVASCRIPT',
                      questionTotal: htmlQuestions.length,
                      assetName:
                          'images/quizzes_cat/javascript/javascript$index.png',
                      subCategLabel: javascript[index],
                      categColor: colors[index],
                    );
                  }))
        ],
      ),
    );
  }
}
