import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final Function answerquestion;
  final int questionindex;

  Quiz({
    @required this.question,
    @required this.answerquestion,
    @required this.questionindex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          question[questionindex]['questionText'],
        ),
        ...(question[questionindex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerquestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
