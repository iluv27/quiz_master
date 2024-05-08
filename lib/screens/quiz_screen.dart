import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/services/database.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';
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
      color: Provider.of<ThemeProvider>(context, listen: false).themeData ==
              lightMode
          ? const Color(0xffffffff)
          : const Color(0xff111111),
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
      height: MediaQuery.of(context).size.height * 0.09,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Provider.of<DatabaseProvider>(context, listen: false)
              .categories
              .length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selIndex = index;
                });
                pageController.jumpToPage(index);
                debugPrint("MAJOR INDEX IS $index");
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(30, 30),
                      topRight: Radius.elliptical(30, 30)),
                  color: Provider.of<ThemeProvider>(context, listen: false)
                              .themeData ==
                          lightMode
                      ? index == selIndex
                          ? Colors.white
                          : Colors.transparent
                      : index == selIndex
                          ? const Color(0xff111111)
                          : Colors.transparent,
                ),
                child: CategoryAvatars(
                  image: Provider.of<DatabaseProvider>(context, listen: false)
                          .categories[index]['category_image'] ??
                      '',
                  label: Provider.of<DatabaseProvider>(context, listen: false)
                          .categories[index]['category_name'] ??
                      '',
                  size: 35,
                  onTapped: () {
                    Provider.of<DatabaseProvider>(context, listen: false)
                        .fetchSubCategoriesData(Provider.of<DatabaseProvider>(
                                    context,
                                    listen: false)
                                .categories[index]['id'] ??
                            '');
                  },
                ),
              ),
            );
          }),
    );
  }
}
