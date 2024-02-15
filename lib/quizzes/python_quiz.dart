import 'package:flutter/material.dart';
import '../questions/quiz_sect.dart';
import '../utilities/categ_list.dart';
import '../widgets/categ_widgets.dart';

class PythonQuiz extends StatefulWidget {
  const PythonQuiz({super.key});

  @override
  State<PythonQuiz> createState() => _PythonQuizState();
}

class _PythonQuizState extends State<PythonQuiz> {
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
                  headerLabel: 'Python',
                ),
                SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    child: GridView.builder(
                        itemCount: bags.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    3, // You can adjust the number of columns here

                                childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return SubcategModel(
                            mainCategName: 'Python',
                            questionTotal: htmlQuestions.length,
                            subCategName: bags[index],
                            assetName: 'images/quizzes_cat/bags/bags$index.jpg',
                            subCategLabel: bags[index],
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
