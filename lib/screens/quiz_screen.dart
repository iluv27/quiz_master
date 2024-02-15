import 'package:flutter/material.dart';
import 'package:quiz_master/widgets/home_widgets.dart';
import '../quizzes/angular_quiz.dart';
import '../quizzes/python_quiz.dart';
import '../quizzes/flutter_quiz.dart';
import '../quizzes/react_quiz.dart';
import '../quizzes/java_quiz.dart';
import '../quizzes/node_quiz.dart';
import '../quizzes/html_css_quiz.dart';
import '../quizzes/express_quiz.dart';
import '../quizzes/javascript_quiz.dart';
import '../utilities/categ_list.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int selIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
          child: SearchWidget(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: topNavigator(context),
        ),
        categView(context),
      ],
    );
  }

  Container categView(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
        child: PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              selIndex = value;
            });
          },
          scrollDirection: Axis.vertical,
          children: const [
            HtmlCssQuiz(),
            JavascriptQuiz(),
            ReactQuiz(),
            AngularQuiz(),
            ExpressQuiz(),
            JavaQuiz(),
            FlutterQuiz(),
            NodeQuiz(),
            PythonQuiz(),
          ],
        ),
      ),
    );
  }

  SizedBox topNavigator(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mainQuizCategory.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selIndex = index;
                });
                debugPrint("$index");
                pageController.jumpToPage(index);
              },
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.elliptical(30, 30),
                        topRight: Radius.elliptical(30, 30)),
                    color:
                        index == selIndex ? Colors.white : Colors.transparent,
                  ),
                  child: mainQuizCategory[index]),
            );
          }),
    );
  }
}
