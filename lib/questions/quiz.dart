// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Assuming you get the questions from an API, replace this with your actual data fetching logic.
  List<Question> questions = [
    Question(
      category: 'General Knowledge',
      type: QuestionType.multipleChoice, // Replace with the desired type
      question: 'What is the capital of France?',
      options: ['Berlin', 'Madrid', 'Paris', 'Rome'],
      correctAnswer: 'Paris',
    ),

    Question(
      category: 'Javascript',
      type: QuestionType.multipleChoice, // Replace with the desired type
      question: 'What is the origing of Java?',
      options: ['1992', '1890', 'No History', '2010'],
      correctAnswer: '1890',
    ),

    Question(
      category: 'Javascript',
      type: QuestionType.multipleChoice, // Replace with the desired type
      question: 'What is the origing of Java?',
      options: ['1992', '1890', 'No History', '2010'],
      correctAnswer: '1890',
    ),

    Question(
      category: 'Python',
      type: QuestionType.multipleChoice, // Replace with the desired type
      question: 'What is the difference between const, var and let?',
      options: [
        'no difference',
        'the\'re all variable',
        'var and const can be changed',
        'let is for only char types'
      ],
      correctAnswer: 'let is for only char types',
    ),
    // Add more questions here
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            size: 32,
            color: Provider.of<ThemeProvider>(context).themeData == lightMode
                ? const Color(0xff111111)
                : Colors.white,
          ),
        ),
        title: Text(
          'Quiz App',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Column(
        children: [
          _buildProgressIndicator(),
          _buildQuestionCard(),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Progress: ${currentQuestionIndex + 1}/${questions.length}'),
          const SizedBox(width: 20),
          CircularProgressIndicator(
            backgroundColor: AppColors.primary.withOpacity(0.3),
            value: (currentQuestionIndex + 1) / questions.length,
            strokeWidth: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard() {
    Question currentQuestion = questions[currentQuestionIndex];

    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category: ${currentQuestion.category}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Type: ${currentQuestion.type}',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            Text(
              'Question: ${currentQuestion.question}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            // Add logic to display options based on the question type
            if (currentQuestion.type == QuestionType.multipleChoice)
              _buildMultipleChoiceOptions(currentQuestion.options),
            // Add other question types as needed
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _nextQuestion(currentQuestion),
              child: const Text('Next Question'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMultipleChoiceOptions(List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: options
          .map(
            (option) => ListTile(
              title: Text(option),
              leading: questions[currentQuestionIndex].selectedAnswer == option
                  ? Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.grey),
                        shape: BoxShape.circle,
                        color: questions[currentQuestionIndex].isCorrect(option)
                            ? Colors.green
                            : Colors.red,
                      ),
                      child: Radio(
                        toggleable: true,
                        value: option,
                        fillColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        groupValue: currentQuestionIndex,
                        onChanged: (value) {
                          setState(() {
                            questions[currentQuestionIndex].selectedAnswer =
                                option;
                          });
                        },
                      ),
                    )
                  : Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          shape: BoxShape.circle,
                          color: Colors.transparent),
                      child: Radio(
                        toggleable: true,
                        value: option,
                        fillColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        groupValue: currentQuestionIndex,
                        onChanged: (value) {
                          setState(() {
                            questions[currentQuestionIndex].selectedAnswer =
                                option;
                          });
                        },
                      ),
                    ),
              onTap: () {
                setState(() {
                  questions[currentQuestionIndex].selectedAnswer = option;
                });
              },
            ),
          )
          .toList(),
    );
  }

  void _nextQuestion(Question currentQuestion) {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        // Check the answer and update the score
        if (currentQuestion.isCorrect(currentQuestion.selectedAnswer)) {
          score++;
        }

        currentQuestionIndex++;
      } else {
        // Check the answer for the last question
        if (currentQuestion.isCorrect(currentQuestion.selectedAnswer)) {
          score++;
        }

        // Show quiz completion message or navigate to a different screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Quiz Completed'),
              content: Text(
                  'Congratulations! You have completed the quiz.\nYour Score: $score/${questions.length}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }
}

enum QuestionType {
  multipleChoice,
  // Add other question types as needed
}

class Question {
  final String category;
  final QuestionType type;
  final String question;
  final List<String> options;
  final String correctAnswer;
  String selectedAnswer;

  Question({
    required this.category,
    required this.type,
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.selectedAnswer = '',
  });

  bool isCorrect(String answer) {
    return answer == correctAnswer;
  }
}
