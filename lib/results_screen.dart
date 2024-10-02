import 'package:flutter/material.dart';
import 'package:advanced_basics/data/questions.dart';
import 'package:advanced_basics/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswer, required this.onClick});

  final List<String> chosenAnswer;
  final void Function() onClick;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].questionHeader,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numOfQuestions = questions.length;
    final numOfCorrectAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answerd $numOfCorrectAnswers out of $numOfQuestions questions correctly!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
                onPressed: onClick,
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 23, 25, 1),
                ),
                icon: const Icon(
                  Icons.restart_alt_rounded,
                  color: Colors.white,
                ),
                label: const Text(
                  'Restart Quiz',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
