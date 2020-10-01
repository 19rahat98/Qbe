import 'package:flutter/material.dart';



class SurveyQuestion extends StatelessWidget {
  final String surveyQuestion;

  SurveyQuestion({this.surveyQuestion});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        surveyQuestion,
        style: TextStyle(
          fontFamily: 'NotoSans',
          fontSize: 25.0,
          color: Colors.black87,
        ),
      ),
    );
  }
}
