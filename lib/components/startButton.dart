import 'package:flutter/material.dart';
import 'package:questionnaire/constants.dart';

class StartButton extends StatelessWidget {
  final String label;
  final Function onPress;

  StartButton({this.label, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: Constants.mainAppColor,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Bitter',
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        margin: EdgeInsets.all(40.0),
        height: Constants.kButtonHeight,
      ),
    );
  }
}
