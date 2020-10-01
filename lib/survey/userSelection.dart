import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/user_bloc.dart';



class LabeledRadio extends StatelessWidget {
  final String label;
  final Function tag;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;

  LabeledRadio({
    this.tag,
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        tag();
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserSelection extends StatefulWidget {
  final String surveyAnswer;
  final Function selectHandler;

  UserSelection({
    Key key,
    @required this.surveyAnswer,
    @required this.selectHandler,
  }) : super(key: key);
  @override
  _UserSelectionState createState() =>
      _UserSelectionState(surveyAnswer, selectHandler);
}

class _UserSelectionState extends State<UserSelection> {
  bool _isRadioSelected = false;
  List paths =[];

  final String surveyAnswer;
  final Function selectHandler;

  _UserSelectionState(this.surveyAnswer, this.selectHandler);

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

/*
  Future uploadData () async {
    await Firestore.instance.collection('users').document(timestamp).setData({

    });
  }*/




  @override
  Widget build(BuildContext context) {
    final UserBloc ub = Provider.of<UserBloc>(context);
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <LabeledRadio>[
          LabeledRadio(
            tag: selectHandler,
            label: surveyAnswer,
            padding: EdgeInsets.fromLTRB(0, 5.0, 5.0, 2.0),
            value: true,
            groupValue: _isRadioSelected,
            onChanged: (bool newValue) {
              print(ub.name);
              setState(() {
                selectHandler();
                _isRadioSelected = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
