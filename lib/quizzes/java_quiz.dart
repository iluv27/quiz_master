import 'package:flutter/material.dart';

import '../questions/quiz_sect.dart';
import '../utilities/categ_list.dart';
import '../widgets/categ_widgets.dart';

class JavaQuiz extends StatefulWidget {
  const JavaQuiz({super.key});

  @override
  State<JavaQuiz> createState() => _JavaQuizState();
}

class _JavaQuizState extends State<JavaQuiz> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          bottom: 0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategHeaderLabel(
                  headerLabel: 'JAVA',
                ),
                SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    child: GridView.builder(
                        itemCount: homeandgarden.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    3, // You can adjust the number of columns here

                                childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return SubcategModel(
                            mainCategName: 'JAVA',
                            subCategName: homeandgarden[index],
                            questionTotal: htmlQuestions.length,
                            assetName:
                                'images/quizzes_cat/homegarden/home$index.jpg',
                            subCategLabel: homeandgarden[index],
                          );
                        }))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
