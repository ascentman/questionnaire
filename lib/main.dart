import 'package:flutter/material.dart';
import 'components/startButton.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'constants.dart';

void main() => runApp(Questionnaire());

class Questionnaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StartContainer(),
      ),
    );
  }
}

class StartContainer extends StatefulWidget {
  @override
  _StartContainerState createState() => _StartContainerState();
}

class _StartContainerState extends State<StartContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          StartButton(
            label: 'Start',
            onPress: () {
              print('Yo!');
            },
          )
        ],
      ),
    );
  }
}
