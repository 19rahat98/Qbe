import 'package:flutter/material.dart';


class GreetingMessage extends StatelessWidget {
  final String welcomeText;
  final String welcomeMessage;

  GreetingMessage({
    this.welcomeText,
    this.welcomeMessage,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            welcomeText,
            style: TextStyle(
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w600,
              fontSize: 32.0,
              color: Colors.black,
            ),
          ),
          Text(
            welcomeMessage,
            style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 16.0,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
