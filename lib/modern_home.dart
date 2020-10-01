import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/blog_bloc.dart';
import 'package:travel_hour/blocs/bookmark_bloc.dart';
import 'package:travel_hour/blocs/place_bloc.dart';
import 'package:travel_hour/blocs/user_bloc.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:travel_hour/models/config.dart';
import 'package:travel_hour/pages/profile.dart';
import 'package:travel_hour/pages/search.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:travel_hour/widgets/featured_places.dart';

import 'package:travel_hour/widgets/popular_places.dart';
import 'package:travel_hour/widgets/recent_places.dart';
import 'package:travel_hour/widgets/recommended_places.dart';

class HomeModern extends StatefulWidget {
  HomeModern({Key key}) : super(key: key);

  _HomeModern createState() => _HomeModern();
}

class _HomeModern extends State<HomeModern> {
  String userName, userEmail;

  String userProfilePic = '';
  int listIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((_) {
      final UserBloc ub = Provider.of<UserBloc>(context);
      final PlaceBloc pb = Provider.of<PlaceBloc>(context);
      final BlogBloc bgb = Provider.of<BlogBloc>(context);
      final BookmarkBloc bb = Provider.of<BookmarkBloc>(context);

      ub.getUserData();
      pb.getLovedList();
      pb.getBookmarkedList();
      bgb.getLovedList();
      bgb.getBookmarkedList();
      bb.getBlogData();
      bb.getPlaceData();
    });
  }

  Widget searchBar(w) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 5),
      child: InkWell(
        child: Container(
          height: 60,
          width: w,
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Row(
            children: <Widget>[
              new Container(height: 40.0, width: 10.0),
              Icon(CupertinoIcons.search),
              SizedBox(
                width: 20,
              ),
              Text(
                'E.g: Almaty, Astana',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
      ),
    );
  }

  Widget header(w) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
        child: SizedBox(
          height: 270,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 310,
                      margin: EdgeInsets.only(
                          top: 10, left: 15, right: 15, bottom: 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 10,
                                offset: Offset(3, 3))
                          ]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/travel4.png",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 20, bottom: 5, right: 10),
                              child: Text(
                                'Welcome to ${Config().countryName}',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ])),

/*                  Text(
                    'Welcome to ${Config().countryName}',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]),
                  )*/
                ],
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Container(
                padding: EdgeInsets.all(7),
                child: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.grey,
                )),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icon.png",
                  height: 40,
                ),
                Text(
                  "${Config().appName}",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w700),
                )
              ],
            ),
            actions: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                ),
              )
            ],
            elevation: 0.0,
          ),
          //backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                header(w),
                PopularPlaces(),
                Featured(),
                RecentPlaces(),
                RecommendedPlaces()
              ],
            ),
          )),
    );
  }
}
