import 'package:flutter/material.dart';
import 'package:questionnaire/constants.dart';

class AnswerButton extends StatefulWidget {
  final String label;
  final Function onPress;

  AnswerButton({this.label, this.onPress});

  @override
  _AnswerButtonState createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPress();
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Constants.answerColor,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  isChecked
                      ? Icon(
                          Icons.check_circle,
                          color: Constants.mainAppColor,
                        )
                      : Icon(
                          Icons.radio_button_unchecked,
                          color: Colors.black26,
                        ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: Text(
                      widget.label,
                      maxLines: 4,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
