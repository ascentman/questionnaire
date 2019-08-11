import 'package:flutter/material.dart';
import 'get_answers_list.dart';
import 'get_questions.dart';

class QuestionPage extends StatelessWidget {
  final int index;

  QuestionPage({this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 240,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/question_${index + 1}_header.png'),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 16,
                    child: getQuestionText(index),
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
