import 'package:flutter/material.dart';
import 'package:travel_hour/survey/survey.dart';

import 'greeting.dart';


class SurveyPage extends StatefulWidget {
  static const String _title = 'Quiz page';

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  int _questionIndex = 0;

  String _welcomeText = 'Hello there!';
  String _welcomeMessage = 'Let\'s start with some basic info.\n';

  final _surveyList = [
    {
      'surveyQuestion': 'Please select a project location:',
      'userPreference': [
        'Brusubi',
        'Kololi',
        'Brufut',
      ],
    },
    {
      'surveyQuestion': 'What service(s) are you looking for?',
      'userPreference': [
        'Design service',
        'Construction service',
      ],
    },
    {
      'surveyQuestion': 'How many rooms do you want in your new home?',
      'userPreference': [
        'One to two',
        'Three to four',
        'Five to six',
        'Seven or more',
      ],
    },
    {
      'surveyQuestion': 'How many bedrooms would you like in your new house?',
      'userPreference': [
        'One',
        'Two',
        'Three',
        'Four or more',
        'I\'m not sure',
      ],
    },
    {
      'surveyQuestion': 'How many bathrooms would you like in your new house?',
      'userPreference': [
        'One',
        'Two',
        'Three',
        'Four or more',
        'I\'m not sure',
      ],
    },
    {
      'surveyQuestion':
      'Have you already purchased the land where the home will be built?',
      'userPreference': [
        'I own a plot',
        'Currently looking',
        'Process of purchasing',
      ],
    },
    {
      'surveyQuestion': 'What is your current status of this project?',
      'userPreference': [
        'Exploring ideas',
        'Planning/budgeting',
        'Ready to hire',
        'In progress',
      ],
    },
    {
      'surveyQuestion': 'When do you need to start the project?',
      'userPreference': [
        'Within a week',
        'Within a month',
        'Within six months',
        'Not sure',
      ],
    },
    {
      'surveyQuestion': 'What\'s your budget?',
      'userPreference': [
        'D250,000',
        'D500,000',
        'D1 Million+',
      ],
    },
    {
      'surveyQuestion': 'What\'s your budget?',
      'userPreference': [
        'D250,000',
        'D500,000',
        'D1 Million+',
      ],
    },
    {
      'surveyQuestion': 'What\'s your budget?',
      'userPreference': [
        'D250,000',
        'D500,000',
        'D1 Million+',
      ],
    },
    {
      'surveyQuestion': 'What\'s your budget?',
      'userPreference': [
        'D250,000',
        'D500,000',
        'D1 Million+',
      ],
    },

  ];

  void _surveyResponse() {
    setState(() {
      _questionIndex += 1;
    });

    if (_questionIndex < _surveyList.length) {
      print('We have made a survey question');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SurveyPage._title),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _questionIndex < 1
                  ? GreetingMessage(
                welcomeText: _welcomeText,
                welcomeMessage: _welcomeMessage,
              )
                  : Container(),

              Survey(
                questionIndex: _questionIndex,
                surveyData: _surveyList,
                surveyResponse: _surveyResponse,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
