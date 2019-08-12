import 'package:flutter/material.dart';
import 'package:questionnaire/constants.dart';

Widget getQuestionText(int index) {
  switch (index + 1) {
    case 1:
      return QuestionText(label: Constants.defaultConfig['goals']);
    case 2:
      return QuestionText(label: Constants.defaultConfig['support_goals']);
    case 3:
      return QuestionText(label: Constants.defaultConfig['biggest_challenges']);
    case 4:
      return QuestionText(label: Constants.defaultConfig['eating_habits']);
    case 5:
      return QuestionText(label: Constants.defaultConfig['everyday_look_like']);
    case 6:
      return QuestionText(label: Constants.defaultConfig['focus_receipts']);
    default:
      return QuestionText(label: 'Unknown question');
  }
}

class QuestionText extends StatelessWidget {
  final String label;

  QuestionText({this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: 3,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 20.0, color: Colors.black87, fontWeight: FontWeight.bold),
    );
  }
}
