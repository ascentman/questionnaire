import 'package:flutter/material.dart';

class Constants {
  static const kButtonHeight = 80.0;
  static const mainAppColor = Color(0xFF64C9AE);
  static const inactivePageIndicatorColor = Color(0xFFDAECE2);
  static const answerColor = Color(0xFFF9F6ED);
  static Map<String, dynamic> defaultConfig = {
    'goals': 'test', //'Welche persönlichen Ziele möchtest du verfolgen?',
    'support_goals':
        'Womit soll dich dein persönlicher Ernährungscoach beim erreichen deiner Ziele unterstützen?',
    'eating_habits': 'Wie sehen deine Essgewohnheiten aus?',
    'biggest_challenges': 'default welcome',
    'everyday_look_like': 'Wie sehen deine Essgewohnheiten aus?',
    'focus_receipts': 'Auf was sollen wir bei deinen Rezepten den Fokus legen?',
  };
}
