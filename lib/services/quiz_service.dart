import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/services/completed.dart';
import 'package:quiz_master/services/database.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/widgets/quiz_card.dart';
import 'package:quiz_master/theme/theme.dart';

// ignore: must_be_immutable
class QuizScreen222 extends StatefulWidget {
  QuizScreen222(
      {super.key,
      required this.questionTitle,
      required this.selectedAnswers,
      required this.questionQuestion});

  List<String> selectedAnswers = [];
  final List<Map<String, dynamic>> questionQuestion;
  // final List<Map<String, dynamic>> questionQuestion;

  String questionTitle;

  @override
  State<QuizScreen222> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen222> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // THE APP BAR
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 121, 64, 14),
                Color.fromARGB(255, 176, 95, 24),
                AppColors.primary,
              ],
            ),
          )),
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              setState(() {
                widget.selectedAnswers = [];
                Provider.of<DatabaseProvider>(context, listen: false)
                    .currentQuestionIndex = 0;
                Navigator.pop(
                  context,
                );
              });
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 20.0),
          ),
          leadingWidth: 35,
          title: Center(
            child: Text(
              widget.questionTitle,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
          actions: const [
            SizedBox(
              width: 30,
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              child: ClipPath(
                clipper: AppBarClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 121, 64, 14),
                        AppColors.primary,
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 15, right: 15),
                child: Container(
                    height: 600,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Provider.of<ThemeProvider>(context, listen: false)
                                  .themeData ==
                              lightMode
                          ? Colors.white
                          : Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: BuildQuizScreen(
                      selectedAnswers: widget.selectedAnswers,
                      questionQuestion: widget.questionQuestion,
                      questionTitle: widget.questionTitle,
                    )),
              ),
            ),
          ],
        ));
  }
}

class BuildQuizScreen extends StatefulWidget {
  const BuildQuizScreen(
      {super.key,
      required this.selectedAnswers,
      required this.questionQuestion,
      required this.questionTitle});
  final List<String> selectedAnswers;
  final List<Map<String, dynamic>> questionQuestion;
  final String questionTitle;
  @override
  State<BuildQuizScreen> createState() => _BuildQuizScreenState();
}

class _BuildQuizScreenState extends State<BuildQuizScreen> {
  bool _isButtonEnabled = false;

  final Gradient _disabledButtonColor = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(172, 121, 64, 14),
      Color.fromARGB(154, 224, 120, 30),
    ],
  );

  final Gradient _enabledButtonColor = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 121, 64, 14),
      AppColors.primary,
    ],
  );

  void answerCorrection() {
    setState(() {
      if (Provider.of<DatabaseProvider>(context, listen: false)
              .currentQuestionIndex ==
          widget.questionQuestion.length - 1) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) {
          return BuildFinishedScreen(
            selectedAnswers: widget.selectedAnswers,
            questionQuestion: widget.questionQuestion,
            questionTitle: widget.questionTitle,
          );
        })));
      } else if (Provider.of<DatabaseProvider>(context, listen: false)
              .currentQuestionIndex !=
          widget.questionQuestion.length) {
        Provider.of<DatabaseProvider>(context, listen: false)
            .currentQuestionIndex++;
      }
      _isButtonEnabled = false;
    });
    // ignore: avoid_print
    print(widget.selectedAnswers);
  }

  void _buttonEnabled() {
    setState(() {
      _isButtonEnabled ? answerCorrection() : null;
    });
  }

  String? selectedAnswer;

  void onAnswerSelected2(String answer) {
    setState(() {
      _isButtonEnabled = true;
      if (widget.selectedAnswers.isNotEmpty && selectedAnswer == answer) {
        widget.selectedAnswers[widget.selectedAnswers.length - 1] = answer;
      } else if (widget.selectedAnswers.isNotEmpty &&
          widget.selectedAnswers.length >
              Provider.of<DatabaseProvider>(context, listen: false)
                  .currentQuestionIndex) {
        selectedAnswer = widget.selectedAnswers.last;
      } else if (widget.selectedAnswers.isNotEmpty &&
          widget.selectedAnswers.length ==
              Provider.of<DatabaseProvider>(context, listen: false)
                  .currentQuestionIndex) {
        widget.selectedAnswers.add(answer);
      } else {
        widget.selectedAnswers.add(answer);
      }
      selectedAnswer = widget.selectedAnswers.last;
    });
  }

  MaterialStateProperty<Color> bgColor(answer) {
    if (selectedAnswer == answer &&
        answer ==
            widget.questionQuestion[
                Provider.of<DatabaseProvider>(context, listen: false)
                    .currentQuestionIndex]['correctAnswer']) {
      return MaterialStateProperty.all(const Color.fromARGB(255, 19, 194, 19));
    } else if (selectedAnswer == answer &&
        answer !=
            widget.questionQuestion[
                Provider.of<DatabaseProvider>(context, listen: false)
                    .currentQuestionIndex]['correctAnswer']) {
      return MaterialStateProperty.all(const Color.fromARGB(255, 223, 46, 46));
    } else if (selectedAnswer == answer) {
      return MaterialStateProperty.all(
          Provider.of<ThemeProvider>(context, listen: false).themeData ==
                  lightMode
              ? const Color.fromARGB(255, 214, 214, 214)
              : Colors.white);
    }
    return MaterialStateProperty.all(
        Provider.of<ThemeProvider>(context, listen: false).themeData ==
                lightMode
            ? const Color.fromARGB(255, 214, 214, 214)
            : Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${Provider.of<DatabaseProvider>(context, listen: false).currentQuestionIndex + 1}/${widget.questionQuestion.length}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:
                            Provider.of<ThemeProvider>(context, listen: false)
                                        .themeData ==
                                    lightMode
                                ? const Color.fromARGB(210, 38, 169, 138)
                                : const Color.fromARGB(255, 255, 173, 101)),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      backgroundColor:
                          Provider.of<ThemeProvider>(context, listen: false)
                                      .themeData ==
                                  lightMode
                              ? const Color.fromARGB(92, 99, 216, 99)
                              : const Color.fromARGB(174, 99, 216, 99),
                      value:
                          Provider.of<DatabaseProvider>(context, listen: false)
                                  .currentQuestionIndex /
                              (widget.questionQuestion.length - 1),
                      strokeWidth: 4.5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Provider.of<ThemeProvider>(context, listen: false)
                                      .themeData ==
                                  lightMode
                              ? const Color.fromARGB(255, 99, 216, 99)
                              : const Color.fromARGB(255, 115, 255, 115)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.questionQuestion[
                      Provider.of<DatabaseProvider>(context, listen: false)
                          .currentQuestionIndex]['question'],
                  style: TextStyle(
                    height: 1.4,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Provider.of<ThemeProvider>(context, listen: false)
                                .themeData ==
                            lightMode
                        ? const Color.fromARGB(169, 0, 0, 0)
                        : Colors.white,
                  ),
                ),
              ),
            ),
            for (var answer in widget.selectedAnswers)
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 30, right: 30),
                child: ElevatedButton(
                  onPressed: () {
                    onAnswerSelected2(answer);
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 60)),
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: bgColor(answer),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10),
                      child: Text(
                        answer,
                        style: TextStyle(
                            height: 1.4,
                            color: selectedAnswer == answer
                                ? Colors.white
                                : const Color.fromARGB(227, 41, 38, 38),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: ShapeDecoration(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(22)),
              ),
              gradient:
                  _isButtonEnabled ? _enabledButtonColor : _disabledButtonColor,
            ),
            child: ElevatedButton(
              onPressed: _buttonEnabled,
              style: ButtonStyle(
                enableFeedback: _isButtonEnabled,
                elevation: MaterialStateProperty.all<double>(0),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(384, 60)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(22)),
                  ),
                ),
              ),
              child: const Text(
                'Next Question',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
