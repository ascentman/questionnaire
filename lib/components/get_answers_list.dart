import 'package:flutter/material.dart';
import 'package:questionnaire/constants.dart';
import 'answer_button.dart';

List<Widget> getAnswersList(int index) {
  void checkAnswer(String value) {
    if (Constants.answers.contains(value)) {
      Constants.answers.remove(value);
    } else {
      Constants.answers.add(value);
    }
  }

  switch (index + 1) {
    case 1:
      List<String> list = [
        'loose_weight',
        'more_energy',
        'be_sportier',
        'optimize_health'
      ];
      return list
          .asMap()
          .map(
            (index, value) => MapEntry(
              index,
              AnswerButton(
                label: Constants.defaultConfig[value],
                onPress: () {
                  checkAnswer(list[index]);
                },
              ),
            ),
          )
          .values
          .toList();
    case 2:
      List<String> list = [
        'motivation',
        'guidance',
        'right_foods',
        'nutrition_tips'
      ];
      return list
          .asMap()
          .map(
            (index, value) => MapEntry(
              index,
              AnswerButton(
                label: Constants.defaultConfig[value],
                onPress: () {
                  checkAnswer(list[index]);
                },
              ),
            ),
          )
          .values
          .toList();
    case 3:
      List<String> list = [
        'find_right_diet',
        'fast_food',
        'weekends',
        'eat_to_much'
      ];
      return list
          .asMap()
          .map(
            (index, value) => MapEntry(
              index,
              AnswerButton(
                label: Constants.defaultConfig[value],
                onPress: () {
                  checkAnswer(list[index]);
                },
              ),
            ),
          )
          .values
          .toList();
    case 4:
      List<String> list = [
        'snacks',
        'eat_more_on_stressful',
        'eat_when_bored',
        'healthy'
      ];
      return list
          .asMap()
          .map(
            (index, value) => MapEntry(
              index,
              AnswerButton(
                label: Constants.defaultConfig[value],
                onPress: () {
                  checkAnswer(list[index]);
                },
              ),
            ),
          )
          .values
          .toList();
    case 5:
      List<String> list = [
        'shift_work',
        'home',
        'normal_working_hours',
        'travel'
      ];
      return list
          .asMap()
          .map(
            (index, value) => MapEntry(
              index,
              AnswerButton(
                label: Constants.defaultConfig[value],
                onPress: () {
                  checkAnswer(list[index]);
                },
              ),
            ),
          )
          .values
          .toList();
    case 6:
      List<String> list = ['vegan', 'vegetarian', 'low_carb', 'balanced'];
      return list
          .asMap()
          .map(
            (index, value) => MapEntry(
              index,
              AnswerButton(
                label: Constants.defaultConfig[value],
                onPress: () {
                  checkAnswer(list[index]);
                },
              ),
            ),
          )
          .values
          .toList();
  }
  return null;
}
