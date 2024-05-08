import 'package:flutter/material.dart';

import '../questions/quiz_sect.dart';
import '../utilities/categ_list.dart';
import '../widgets/categ_widgets.dart';

class NodeQuiz extends StatefulWidget {
  const NodeQuiz({super.key});

  @override
  State<NodeQuiz> createState() => _NodeQuizState();
}

class _NodeQuizState extends State<NodeQuiz> {
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
                  headerLabel: 'Node.js',
                ),
                SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    child: GridView.builder(
                        itemCount: kids.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    3, // You can adjust the number of columns here

                                childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return SubcategModel(
                            mainCategName: 'Node.js',
                            questionTotal: htmlQuestions.length,
                            assetName: 'images/quizzes_cat/kids/kids$index.jpg',
                            subCategLabel: kids[index],
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
