
import 'package:flutter/material.dart';
import 'package:travel_hour/pages/support_pages/profileSecond.dart';

import 'app_theme.dart';
import 'drawer_user_cont.dart';
import 'feedback_screen.dart';
import 'help_screen.dart';
import 'home_drawer.dart';
import 'invite_friend_screen.dart';



class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;

  @override
  void initState () {
    drawerIndex = DrawerIndex.HOME;
    screenView = ProfilePage();
    super.initState ( );
  }

  @override
  Widget build (BuildContext context) {
    return Container (
      color: AppTheme.nearlyWhite,
      child: SafeArea (
        top: false,
        bottom: false,
        child: Scaffold (
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController (
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery
                .of ( context )
                .size
                .width * 0.75,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex ( drawerIndexdata );
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex (DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState ( () {
          screenView = const ProfilePage( );
        } );
      } else if (drawerIndex == DrawerIndex.Help) {
        setState ( () {
          screenView = HelpScreen ( );
        } );
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState ( () {
          screenView = FeedbackScreen ( );
        } );
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState ( () {
          screenView = InviteFriend ( );
        } );
      } else {

      }
    }
  }
}
