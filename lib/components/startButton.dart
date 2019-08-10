import 'package:flutter/material.dart';
import 'package:questionnaire/constants.dart';

class StartButton extends StatelessWidget {
  final String label;
  final Function onPress;
  final double margin;
  final double padding;
  final double fontSize;
  final String fontFamily;
  final double borderRadius;

  StartButton(
      {this.label,
      this.fontSize,
      this.padding,
      this.margin,
      this.fontFamily,
      this.borderRadius,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Constants.mainAppColor,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSize,
              color: Colors.white,
            ),
          ),
        ),
        margin: EdgeInsets.only(bottom: margin, left: margin, right: margin),
        padding: EdgeInsets.all(padding),
      ),
    );
  }
}
