import 'package:flutter/material.dart';
import '../questions/quiz_sect.dart';
import '../utilities/categ_list.dart';
import '../widgets/categ_widgets.dart';

class HtmlCssQuiz extends StatefulWidget {
  const HtmlCssQuiz({super.key});

  @override
  State<HtmlCssQuiz> createState() => _HtmlCssQuizState();
}

class _HtmlCssQuizState extends State<HtmlCssQuiz> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategHeaderLabel(
            headerLabel: 'HTML & CSS',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.63,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                itemCount: html.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    crossAxisCount:
                        2, // You can adjust the number of columns here

                    childAspectRatio: 0.85),
                itemBuilder: (context, index) {
                  return SubcategModel(
                    mainCategName: 'HTML & CSS',
                    subCategName: html[index],
                    assetName: 'images/quizzes_cat/html/html$index.png',
                    subCategLabel: html[index],
                    categColor: colors[index],
                    questionTotal: htmlQuestions[0].length,
                  );
                }),
          )
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
];
