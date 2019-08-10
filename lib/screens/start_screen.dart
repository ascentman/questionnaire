import 'package:flutter/material.dart';
import 'package:questionnaire/components/startButton.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:questionnaire/constants.dart';
import 'package:questionnaire/screens/homepage_screen.dart';

class StartScreen extends StatefulWidget {
  static const id = 'start_screen';
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorizeAnimatedTextKit(
                text: [
                  "QUESTIONNAIRE",
                ],
                textStyle: TextStyle(fontSize: 32.0, fontFamily: "Bitter"),
                colors: [
                  Constants.mainAppColor,
                  Colors.white70,
                  Colors.orange,
                ],
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
            SizedBox(
              height: 100,
            ),
            StartButton(
              label: 'Start',
              margin: 40.0,
              padding: 8.0,
              borderRadius: 40.0,
              fontFamily: 'Bitter',
              fontSize: 24.0,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
