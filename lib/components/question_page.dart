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
                      child: getText(index),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    AnswerButton(
                      label: 'Answer 1 goes here',
                      onPress: () {
                        print('1 pressed');
                      },
                    ),
                    AnswerButton(
                      label: 'Answer 2 goes here',
                      onPress: () {
                        print('2 pressed');
                      },
                    ),
                    AnswerButton(
                      label: 'Answer 3 goes here',
                      onPress: () {
                        print('3 pressed');
                      },
                    ),
                    AnswerButton(
                      label: 'Answer 4 goes here',
                      onPress: () {
                        print('3 pressed');
                      },
                    ),
                    AnswerButton(
                      label:
                          'Answer 5 goes here Answer 4 goes here d w w kwk w wddssdsdsdssd',
                      onPress: () {
                        print('4 pressed');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget getText(int index) {
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
          fontSize: 19.0, color: Colors.black87, fontWeight: FontWeight.bold),
    );
  }
}
