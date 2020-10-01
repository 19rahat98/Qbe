import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';


import 'package:travel_hour/pages/blog.dart';
import 'package:travel_hour/pages/bookmark.dart';
import 'package:travel_hour/pages/mapScreen.dart';
import 'package:travel_hour/pages/profile.dart';
import 'package:travel_hour/pages/settings.dart';
import 'package:travel_hour/pages/support_pages/navigation_user_profile.dart';

import '../modern_home.dart';

class NavBar extends StatefulWidget {
  NavBar({Key key}) : super(key: key);

  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {


  Widget page = HomeModern();
  int currentIndex = 0;
  

  whenBackButtonClicked() {
    if(currentIndex == 0){
      SystemNavigator.pop();
    }else{
      setState(() {
        currentIndex = 0;
        page = HomeModern();
      });
    }
    
  }

  Widget customNavBar () {
    return Container(
      
      
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10
          )
        ]
      ),
      child: BottomNavyBar(
          selectedIndex: currentIndex,
          showElevation: true,
          itemCornerRadius: 25,
          
          
          onItemSelected: (index) => setState(() {
            currentIndex = index;
            if(index == 0) {
              page = HomeModern();
            }else if(index == 1){
              page = BlogPage();
            }else if(index == 2){
              page = BookmarkPage();
            }else if(index == 3){
              page = MapScreenPage();
            }else if(index == 4){
              page = NavigationHomeScreen();
            }
            
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.explore),
              title: Text('Attractions'),
              activeColor: Colors.lightBlueAccent,
              inactiveColor: Colors.grey[500],
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.camera),
              title: Text('News'),
              activeColor: Colors.lightBlueAccent,
              inactiveColor: Colors.grey[500],
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.bookmark_border),
              title: Text(
                'Bookmark',
              ),
              activeColor: Colors.lightBlueAccent,
              inactiveColor: Colors.grey[500],
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(LineIcons.map),
              title: Text('Map mode'),
              activeColor: Colors.lightBlueAccent,
              inactiveColor: Colors.grey[500],
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.lightBlueAccent,
              inactiveColor: Colors.grey[500],
              textAlign: TextAlign.center,
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return whenBackButtonClicked();
      },
      child: Scaffold(
        bottomNavigationBar: customNavBar(), 
        body: page),
    );
  }
}