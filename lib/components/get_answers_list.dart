import 'package:flutter/material.dart';
import 'package:questionnaire/constants.dart';
import 'answer_button.dart';

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
          .map(
            (value) => AnswerButton(
              label: value,
              onPress: () {
                print('1');
              },
            ),
          )
          .toList();
    case 2:
      List<String> list = [
        Constants.defaultConfig['motivation'],
        Constants.defaultConfig['guidance'],
        Constants.defaultConfig['right_foods'],
        Constants.defaultConfig['nutrition_tips']
      ];
      return list
          .map(
            (value) => AnswerButton(
              label: value,
              onPress: () {
                print('1');
              },
            ),
          )
          .toList();
    case 3:
      List<String> list = [
        Constants.defaultConfig['find_right_diet'],
        Constants.defaultConfig['fast_food'],
        Constants.defaultConfig['weekends'],
        Constants.defaultConfig['eat_to_much']
      ];
      return list
          .map(
            (value) => AnswerButton(
              label: value,
              onPress: () {
                print('1');
              },
            ),
          )
          .toList();
    case 4:
      List<String> list = [
        Constants.defaultConfig['snacks'],
        Constants.defaultConfig['eat_more_on_stressful_days'],
        Constants.defaultConfig['eat_when_bored'],
        Constants.defaultConfig['healthy']
      ];
      return list
          .map(
            (value) => AnswerButton(
              label: value,
              onPress: () {
                print('1');
              },
            ),
          )
          .toList();
    case 5:
      List<String> list = [
        Constants.defaultConfig['shift_work'],
        Constants.defaultConfig['home'],
        Constants.defaultConfig['normal_working_hours'],
        Constants.defaultConfig['travel']
      ];
      return list
          .map(
            (value) => AnswerButton(
              label: value,
              onPress: () {
                print('1');
              },
            ),
          )
          .toList();
    case 6:
      List<String> list = [
        Constants.defaultConfig['vegan'],
        Constants.defaultConfig['vegetarian'],
        Constants.defaultConfig['low_carb'],
        Constants.defaultConfig['balanced']
      ];
      return list
          .map(
            (value) => AnswerButton(label: value),
          )
          .toList();
  }
  return null;
}
