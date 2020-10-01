import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/internet_bloc.dart';
import 'package:travel_hour/blocs/sign_in_bloc.dart';
import 'package:travel_hour/models/config.dart';
import 'package:travel_hour/pages/success.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:travel_hour/utils/snacbar.dart';
import 'package:travel_hour/utils/toast.dart';
import 'package:travel_hour/widgets/loading_signin_ui.dart';

class WellComePage extends StatefulWidget {
  WellComePage({Key key}) : super(key: key);

  _WellComePageState createState() => _WellComePageState();
}

class _WellComePageState extends State<WellComePage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool signInStart = false;
  String brandName;


  void handleFacebbokLogin () async{
    final SignInBloc sb = Provider.of<SignInBloc>(context);
    final InternetBloc ib = Provider.of<InternetBloc>(context);
    await ib.checkInternet();
    if(ib.hasInternet == false){
      openSnacbar(_scaffoldKey, 'No internet available');
    }else{
      setState((){ 
        signInStart = true;
        brandName = 'facebook';
        });

      await sb.logInwithFacebook().then((_){
        if(sb.hasError == true){
          
          openToast1(context, 'Error with facebook login! Please try with google');
          setState(() {
            signInStart = false;
          });
        }else {
          sb.checkUserExists().then((value){
          if(sb.userExists == true){
            sb.getUserData(sb.uid).then((value) => sb.saveDataToSP().then((value) => sb.setSignIn().then((value) => nextScreenReplace(context, SuccessPage()))));
          } else{
            sb.getJoiningDate().then((value) => sb.saveDataToSP().then((value) => sb.saveToFirebase().then((value) => sb.setSignIn().then((value) => nextScreenReplace(context, SuccessPage())))));
          }
            });
          
        }
      });
      
    }
  }

  


  void handleGoogleLogin () async{
    final SignInBloc sb = Provider.of<SignInBloc>(context);
    final InternetBloc ib = Provider.of<InternetBloc>(context);
    await ib.checkInternet();
    if(ib.hasInternet == false){
      openSnacbar(_scaffoldKey, 'No internet available');
    }else{
      setState((){ 
        signInStart = true;
        brandName = 'google';
        });

      await sb.signInWithGoogle().then((_){
        if(sb.hasError == true){
          
          openToast1(context, 'Something is wrong. Please try again.');
          setState(() {
            signInStart = false;
          });
        }else {
          sb.checkUserExists().then((value){
          if(sb.userExists == true){
            sb.getUserData(sb.uid).then((value) => sb.saveDataToSP().then((value) => sb.setSignIn().then((value) => nextScreenReplace(context, SuccessPage()))));
          } else{
            sb.getJoiningDate().then((value) => sb.saveDataToSP().then((value) => sb.saveToFirebase().then((value) => sb.setSignIn().then((value) => nextScreenReplace(context, SuccessPage())))));
          }
            });
          
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: signInStart == false ? welcomeUI() : loadingUI(brandName));
  }





  Widget welcomeUI() {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Welcome to',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
            ),
            Text(
              '${Config().appName}',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 3,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(40)),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                'Explore every famous places of beautiful country ${Config().countryName} and find nearby attractions and places of interest with the easiest way.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600]),
              ),
            ),
            Spacer(),
            Container(
              height: 45,
              width: w * 0.70,
              child: FlatButton.icon(
                icon: Icon(FontAwesomeIcons.google, color: Colors.white,),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                label: Text(
                  'Continue with google',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16),
                ),
                color: Colors.grey[800],
                onPressed: () {
                  handleGoogleLogin();
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 45,
              width: w * 0.70,
              child: FlatButton.icon(
                icon: Icon(FontAwesomeIcons.facebook, color: Colors.white,),
                
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                label: Text(
                  'Continue with facebook',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16),
                ),
                color: Colors.blueAccent,
                onPressed: () {
                  handleFacebbokLogin();
                },
              ),
            ),
            SizedBox(
              height: h * 0.15,
            )
          ],
        ),
      ),
    );
  }


  
}
