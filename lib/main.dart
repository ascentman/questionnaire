import 'package:flutter/material.dart';
import 'package:questionnaire/screens/start_screen.dart';
import 'screens/homepage_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(Questionnaire());

class Questionnaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, // status bar color
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: StartScreen.id,
      routes: {
        StartScreen.id: (context) => StartScreen(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
