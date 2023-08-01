import 'package:course_2nd_project/result_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  bool isCorrectAnswer(answer) {
    return answer['user_answer'] == answer['correct_answer'];
  }

  @override
  Widget build(BuildContext context) {
    const correctAnsweColor = Colors.green;
    const wrongAnsweColor = Colors.pink;

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (data) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCorrectAnswer(data)
                            ? correctAnsweColor
                            : wrongAnsweColor,
                      ),
                      child: Center(
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: GoogleFonts.lato(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ResultText(
                            color: Colors.white,
                            text: data['question'] as String,
                          ),
                          const SizedBox(height: 5),
                          ResultText(
                            color: wrongAnsweColor,
                            text: data['user_answer'] as String,
                          ),
                          ResultText(
                              color: correctAnsweColor,
                              text: data['correct_answer'] as String),
                        ],
                      ),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
