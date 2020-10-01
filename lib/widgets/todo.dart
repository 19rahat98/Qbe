import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travel_hour/pages/comments.dart';
import 'package:travel_hour/pages/guide.dart';
import 'package:travel_hour/pages/hotel.dart';
import 'package:travel_hour/pages/restaurant.dart';
import 'package:travel_hour/utils/next_screen.dart';

Widget todo (context, timestamp, lat, lng){
  return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Place to Visit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, fontFamily: 'Poppins')),

                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    height: 3,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(40)),
                  ),
          Container(

            //color: Colors.brown,
            height: 330,
            //width: w,
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 1.4,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                InkWell(
                  child: Stack(
                    children: <Widget>[
                      Container(

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey[200],
                                  offset: Offset(0, 0),
                                  blurRadius: 3)
                            ]),
                      ),
                      Positioned(
                        top: 15,
                        left: 40,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey[300],
                                    offset: Offset(0, 0),
                                    blurRadius: 2)
                              ]),
                          child: Icon(
                            LineIcons.map,
                            size: 40,
                            color: Color(0xff357B84),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 15,
                        child: Text(
                          'Travel Guide',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    nextScreen(context, GuidePage(timestamp: timestamp, lat: lat, lng: lng,));
                  },
                ),
                InkWell(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey[200],
                                  offset: Offset(0, 0),
                                  blurRadius: 3)
                            ]),
                      ),
                      Positioned(
                        top: 15,
                        left: 40,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey[300],
                                    offset: Offset(0, 0),
                                    blurRadius: 2)
                              ]),
                          child: Icon(
                            LineIcons.hotel,
                            size: 40,
                            color: Color(0xff840F11),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 15,
                        child: Text(
                          'Nearby Hotels',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                   nextScreen(context, HotelPage(lat: lat, lng: lng));

                  },
                ),
                InkWell(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey[200],
                                  offset: Offset(0, 0),
                                  blurRadius: 3)
                            ]),
                      ),
                      Positioned(
                        top: 15,
                        left: 40,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey[300],
                                    offset: Offset(0, 0),
                                    blurRadius: 2)
                              ]),
                          child: Icon(
                            LineIcons.bell,
                            size: 30,
                            color: Color(0xff1C3C84),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 15,
                        child: Text(
                          'Nearby Restaurents',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    nextScreen(context, RestaurantPage(lat: lat, lng: lng));
                  },
                ),
                InkWell(
                  child: Stack(
                    children: <Widget>[
                      Container(

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey[200],
                                  offset: Offset(0, 0),
                                  blurRadius: 3)
                            ]),
                      ),
                      Positioned(
                        top: 15,
                        left: 40,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey[300],
                                    offset: Offset(5, 5),
                                    blurRadius: 2)
                              ]),
                          child: Icon(
                            LineIcons.comment,
                            size: 30,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 15,
                        child: Text(
                          'User Reviews',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    nextScreen(context, CommentsPage(title: 'User Reviews', timestamp: timestamp,));
                  },
                ),
              ],
            ),
          )
        ],

    );
}