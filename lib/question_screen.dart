import 'package:course_2nd_project/answer_button.dart';
import 'package:course_2nd_project/constants/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String asnwer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var activeQuestionIndex = 0;

  answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      activeQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext conntext) {
    final curentQuestion = questions[activeQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              curentQuestion.text,
              // style: const TextStyle(color: Colors.white, fontSize: 24),
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...curentQuestion.shuffledAnswers.map(
              (answer) => AnswerButton(
                answerText: answer,
                onSelectAnswer: () {
                  answerQuestion(answer);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
