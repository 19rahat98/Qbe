import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/bookmark_bloc.dart';
import 'package:travel_hour/blocs/internet_bloc.dart';
import 'package:travel_hour/blocs/place_bloc.dart';
import 'package:travel_hour/utils/toast.dart';
import 'package:travel_hour/widgets/other_places.dart';
import 'package:travel_hour/widgets/todo.dart';







class PlaceDetailsPage extends StatefulWidget {
  
  final String placeName,location,timestamp,description, tag;
  final double lat,lng;
  final List images;
  

  const PlaceDetailsPage({Key key, @required this.placeName, this.location, this.timestamp, this.description, this.lat, this.lng, this.images, this.tag}) : super(key: key);

  @override
  _PlaceDetailsPageState createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {


  @override
  void initState() { 
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((_){
      final PlaceBloc pb = Provider.of<PlaceBloc>(context);
      pb.loveIconCheck(widget.timestamp);
      pb.bookmarkIconCheck(widget.timestamp);
      pb.getLovesAmount(widget.timestamp);
      pb.getCommentsAmount(widget.timestamp);
    });
  }


  handleLoveClick (timestamp) {
    final InternetBloc ib = Provider.of<InternetBloc>(context);
    final PlaceBloc pb = Provider.of<PlaceBloc>(context);
    ib.checkInternet();
    if(ib.hasInternet == false){
      openToast(context, 'No internet available');
    } else{
      pb.loveIconClicked(timestamp);
    }
    
  }


  handleBookmarkClick (timestamp) {
    final InternetBloc ib = Provider.of<InternetBloc>(context);
    final PlaceBloc pb = Provider.of<PlaceBloc>(context);
    final BookmarkBloc bb = Provider.of<BookmarkBloc>(context);
    ib.checkInternet();
    if(ib.hasInternet == false){
      openToast(context, 'No internet available');
    } else{
      pb.bookmarkIconClicked(timestamp, context);
      bb.getPlaceData();

    }
    
  }



  Widget cachedImage(index) {
    return CachedNetworkImage(
      imageUrl: widget.images[index],
      imageBuilder: (context, imageProvider) => Container(
        height: 280,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Icon(
        LineIcons.photo,
        size: 30,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PlaceBloc pb = Provider.of<PlaceBloc>(context);
    
    double w = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              
              children: <Widget>[
                Hero(
                  tag: widget.tag,
                    child: Container(
                      color: Colors.white,
                      child: Container(
                      height: 320,
                      width: w,
                      decoration: BoxDecoration(
                    
                        color: Colors.white,
                        
                      ),
                      child: Carousel(
                        dotBgColor: Colors.transparent,
                        showIndicator: true,
                        dotSize: 5,
                        dotSpacing: 15,

                        boxFit: BoxFit.cover,
                        images: [
                          cachedImage(0),
                          cachedImage(1),
                          cachedImage(2)
                        ]
                      ),
                  ),
                    ),
                ),
                Positioned(
                  top: 50,
                  left: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue.withOpacity(0.9),
                    child: IconButton(
                      icon: Icon(
                        LineIcons.arrow_left,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                   
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.location_on, size: 20, color: Colors.grey,),
                      Expanded(child: Text(widget.location, style: TextStyle(fontSize: 13, color: Colors.grey[600],),maxLines: 2, overflow: TextOverflow.ellipsis,   )),
                      
                      IconButton(icon: pb.loveIcon, onPressed: ()=> handleLoveClick(widget.timestamp)),
                      IconButton(icon: pb.bookmarkIcon, onPressed: ()=> handleBookmarkClick(widget.timestamp)),

                    ],
                  ),
                  Text(widget.placeName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, fontFamily: 'Poppins')),
                  
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    height: 3,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(40)),
                  ),
                  Row(children: <Widget>[
                    Icon(Icons.favorite, color: Colors.grey, size: 20,),
                    SizedBox(width: 2,),
                    Text('${pb.loves.toString()} People love this'),

                    SizedBox(width: 20,),
                    Icon(Icons.comment, color: Colors.grey, size: 20,),
                    SizedBox(width: 2,),
                    Text(pb.commentsCount.toString())
                  ],),

                  SizedBox(height: 20,),
                  
                  Html(data: '''${widget.description}''',defaultTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  todo(context, widget.timestamp, widget.lat, widget.lng),
                  SizedBox(height: 20,),
                  OtherPlaces()
                ],
              ),
              
              )

            
          ],
        ),
      ),
    );
  }
}