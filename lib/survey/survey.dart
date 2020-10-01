import 'package:flutter/material.dart';

import './surveyQuestion.dart';
import './userSelection.dart';

class Survey extends StatelessWidget {
  final List<Map<String, Object>> surveyData;
  final Function surveyResponse;
  final int questionIndex;

  Survey({
    @required this.surveyData,
    @required this.questionIndex,
    @required this.surveyResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
        SurveyQuestion(surveyQuestion: surveyData[questionIndex]['surveyQuestion'],),
        ...(surveyData[questionIndex]['userPreference'] as List<String>).map((userSelection) {
      return UserSelection(selectHandler: surveyResponse, surveyAnswer: userSelection,);
    }).toList()
    ],
    ),
    );
  }
}
