import 'package:flutter/material.dart';
import 'package:questionnaire/components/answer_button.dart';
import 'package:questionnaire/constants.dart';

class QuestionPage extends StatelessWidget {
  final int index;

  QuestionPage({this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/question_${index + 1}_header.png'),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 10.0),
                  child: Container(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      child: getQuestionText(index),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: getAnswersList(index),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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

List<Widget> getAnswersList(int index) {
  switch (index + 1) {
    case 1:
      List<String> list = [
        Constants.defaultConfig['loose_weight'],
        Constants.defaultConfig['more_energy'],
        Constants.defaultConfig['be_sportier'],
        Constants.defaultConfig['optimize_health']
      ];
      return list
          .map((value) => AnswerButton(
                label: value,
                onPress: () {
                  print('1');
                },
              ))
          .toList();
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
          fontSize: 19.0, color: Colors.black87, fontWeight: FontWeight.bold),
    );
  }
}
