import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_homepage_moduel/constant/constants.dart';
import 'package:travel_homepage_moduel/model/dailydeals_model.dart';
import 'package:travel_homepage_moduel/model/five_star_hotel.dart';
import 'package:travel_homepage_moduel/model/recommended_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _height;
  double _width;

  List<DailyDeals> dailyDeals;
  List<Recommended> recommended;
  List<FiveStarHotel> fiveStarHotel;

  int _currentIndex = 0;

  int _selected = 0;

  final List<Widget> _children = [
    HomeScreenOne(),
    HomeScreenOne(),
    HomeScreenOne(),
    HomeScreenOne(),
  ];

  @override
  void initState() {
    dailyDeals = Constants.getDailyDealsList();
    recommended = Constants.getRecommendedList();
    fiveStarHotel = Constants.getFiveStarHotelList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          height: 60,
          color: Colors.white54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Color.fromRGBO(68, 51, 156, 1),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  }),
              IconButton(
                  icon: Icon(Icons.insert_drive_file),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  }),
              IconButton(
                  icon: Icon(Icons.notifications_none),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  }),
              IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenOne extends StatefulWidget {
  @override
  _HomeScreenOneState createState() => _HomeScreenOneState();
}

class _HomeScreenOneState extends State<HomeScreenOne> {
  double _height;
  double _width;

  List<DailyDeals> dailyDeals;
  List<Recommended> recommended;
  List<FiveStarHotel> fiveStarHotel;

  void initState() {
    dailyDeals = Constants.getDailyDealsList();
    recommended = Constants.getRecommendedList();
    fiveStarHotel = Constants.getFiveStarHotelList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: _height / 3.5,
              floating: false,
              backgroundColor: Colors.white,
              // leading:Icon(Icons.menu),
              //#f02730
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                // centerTitle: true,
                background: Image.asset(
                  'assets/images/sunset_background.jpeg',
                  height: _height,
                  width: _width,
                  fit: BoxFit.cover,
                ),
              ),
              bottom: PreferredSize(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20.0),
                        alignment: Alignment.topLeft,
                        // color: Colors.red,
                        height: _height / 10,
                        width: _width,
                        child: Text(
                          "What are you "
                              "\nlooking for?",
                          style: TextStyle(
                              fontFamily: 'Roboto Regular',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                              height: 1.3,
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          left: 20,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          // color: Colors.blueAccent.withOpacity(.5),
                          color: Color.fromRGBO(242, 242, 242, 1),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        width: _width,
                        height: _height / 18,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black38,
                            ),
                            hintText: 'Where do you want to go?',
                            hintStyle: TextStyle(
                                fontFamily: 'Roboto Medium',
                                fontSize: 15.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                            contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 12.0, 15.0),
                            /*border: OutlineInputBorder(
 // borderSide: BorderSide(color: Colors.grey),
 borderRadius:
 BorderRadius.all(Radius.circular(30.0)),
 ),*/
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  preferredSize: Size(_width, _height / 9)),
            ),
          ];
        },
        body: Container(
          height: _height,
          width: _width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          height: _height / 8.5,
                          width: _width / 3.5,
                          // color: Colors.red,
                          child: Card(
                            // color: Colors.blueGrey[100],
                            color: Color.fromRGBO(246, 246, 246, 1),
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(child: Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          'assets/images/flight.png',
                                          width: _width / 10.5,
                                          height: _height / 21,
                                          fit: BoxFit.fill,
                                        ),
                                      ),),
                                      Expanded(child: Text(
                                        'Flights',
                                        style: TextStyle(
                                            fontFamily: 'Roboto Medium',
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600),
                                      ),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: _height / 8.5,
                        width: _width / 3.5,
                        // color: Colors.red,
                        child: Card(
                          //color: Colors.blueGrey[100],
                          color: Color.fromRGBO(246, 246, 246, 1),
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(child: Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        'assets/images/hotel.png',
                                        height: _height / 21,
                                        width: _width / 10.5,
                                        fit: BoxFit.fill,
                                      ),
                                    ),),
                                    Expanded(child:Text(
                                      'Hotels',
                                      style: TextStyle(
                                          fontFamily: 'Roboto Medium',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600),
                                    ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: _height / 8.5,
                        width: _width / 3.5,
                        // color: Colors.red,
                        child: Card(
                          //color: Colors.blueGrey[100],
                          color: Color.fromRGBO(246, 246, 246, 1),
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(child: Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        'assets/images/cars.png',
                                        height: _height / 21,
                                        width: _width / 10,
                                        fit: BoxFit.fill,
                                      ),
                                    ),),
                                    Expanded(child: Text(
                                      'Cars',
                                      style: TextStyle(
                                          fontFamily: 'Roboto Medium',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600),
                                    ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5.0, top: 20.0),
                    child: Text(
                      'Daily Deals',
                      style: TextStyle(
                          fontFamily: 'Roboto Regular',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(top: 5.0),
                      height: _height / 4.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // color: Colors.red,
                      ),
                      child: PageView.builder(
                          itemCount: dailyDeals.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return _buildDaliyDeals(dailyDeals[index], index);
                          }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 5.0, top: 20.0),
                        child: Text(
                          'Recommended for you',
                          style: TextStyle(
                              fontFamily: 'Roboto Regular',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 5.0, top: 20.0),
                        child: Text(
                          'See more',
                          style: TextStyle(
                              fontFamily: 'Roboto Regular',
                              color: Color.fromRGBO(68, 51, 156, 1),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    height: _height / 5.5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: recommended.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildRecommendedList(recommended[index]);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 5.0, top: 20.0),
                        child: Text(
                          'Top 5 star hotels',
                          style: TextStyle(
                              fontFamily: 'Roboto Regular',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 5.0, top: 20.0),
                        child: Text(
                          'See more',
                          style: TextStyle(
                              fontFamily: 'Roboto Regular',
                              color: Color.fromRGBO(68, 51, 156, 1),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    height: _height / 3.8,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: fiveStarHotel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildFiveStarHotel(fiveStarHotel[index]);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5.0, top: 20.0),
                    child: Text(
                      'Famous places',
                      style: TextStyle(
                          fontFamily: 'Roboto Regular',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: _height / 5,
                        width: _width / 2.2,
                        // color:Colors.redAccent,
                        child: Stack(
                          children: <Widget>[
                            Card(
                              // color:Colors.red,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child:Image.asset(
                                  'assets/images/sydney.jpeg',
                                  width: _width,
                                  height: _height,
                                  fit: BoxFit.fill,
                                  color:Colors.black.withOpacity(0.6),
                                  colorBlendMode:BlendMode.softLight,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'SYDNEY',
                                style: TextStyle(
                                    fontFamily: 'Roboto Regular',
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: _height / 5,
                        width: _width / 2.2,
                        // color:Colors.redAccent,
                        child: Stack(
                          children: <Widget>[
                            Card(
                              // color:Colors.red,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  'assets/images/bangkok.jpg',
                                  width: _width,
                                  fit: BoxFit.fill,
                                  height: _height,
                                  color:Colors.black.withOpacity(0.6),
                                  colorBlendMode:BlendMode.softLight,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'BANGKOK',
                                style: TextStyle(
                                    fontFamily: 'Roboto Regular',
                                    fontSize: 20,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: _height / 5,
                        width: _width / 2.2,
                        // color:Colors.redAccent,
                        child: Stack(
                          children: <Widget>[
                            Card(
                              // color:Colors.red,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  'assets/images/london.jpg',
                                  width: _width,
                                  fit: BoxFit.fill,
                                  height: _height,
                                  color:Colors.black.withOpacity(0.6),
                                  colorBlendMode:BlendMode.softLight,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'LONDON',
                                style: TextStyle(
                                    fontFamily: 'Roboto Regular',
                                    fontSize: 20,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: _height / 5,
                        width: _width / 2.2,
                        // color:Colors.redAccent,
                        child: Stack(
                          children: <Widget>[
                            Card(
                              // color:Colors.red,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  'assets/images/istanbul.jpeg',
                                  width: _width,
                                  fit: BoxFit.fill,
                                  height: _height,
                                  color:Colors.black.withOpacity(0.6),
                                  colorBlendMode:BlendMode.softLight,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'ISTANBUL',
                                style: TextStyle(
                                    fontFamily: 'Roboto Regular',
                                    fontSize: 20,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFiveStarHotel(FiveStarHotel item) {
    return Container(
      width: _width / 2.2,
      padding: EdgeInsets.only(left: 0.0, right: 5.0),
      color: Colors.white,
      child: Card(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      item.img,
                      width: _width,
                      height: _height,
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      // child:Icon(Icons.favorite_border,color:Colors.white,),
                      child: Container(
                        margin: EdgeInsets.only(top: 5.0, right: 5.0),
                        alignment: Alignment.center,
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: Colors.transparent.withOpacity(0.5),
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          item.hotelName,
                          style: TextStyle(
                            fontFamily: 'Roboto Regular',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  item.location,
                                  style: TextStyle(
                                    fontFamily: 'Roboto Medium',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.0,
                                    color: Colors.black38,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Icon(
                                Icons.location_on,
                                size: 14.5,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          Container(
                            height: 15,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 10.0,
                                ),
                                Text(
                                  '4.9',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDaliyDeals(DailyDeals item, int index) {
    return Container(
      width: _width,
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                      child: Image.asset(
                        item.img,
                        width: _width,
                        height: _height,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    // child:Icon(Icons.favorite_border,color:Colors.white,),
                    child: Container(
                      margin: EdgeInsets.only(top: 5.0, right: 5.0),
                      alignment: Alignment.center,
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Colors.transparent.withOpacity(0.5),
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 5.0,
                      left: 10.0,
                      bottom:10.0
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Text(
                          item.add,
                          style: TextStyle(
                              fontFamily: 'Roboto Regular',
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Text(
                            item.star,
                            style: TextStyle(
                                fontFamily: 'Roboto Medium',
                                fontSize: 12.5,
                                fontWeight: FontWeight.w500,
                                color: Colors.orangeAccent),
                          ),

                          Icon(
                            Icons.location_on,
                            color: Colors.black38,
                            size: 15.0,
                          ),

                          Text(
                            item.location,
                            style: TextStyle(
                                fontFamily: 'Roboto Medium',
                                color: Colors.black38,
                                fontSize: 12.5,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          Container(
                            height: 18,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 10.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  item.rating,
                                  style: TextStyle(
                                      fontFamily: 'Roboto Regular',
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            item.review,
                            style: TextStyle(
                                color: Colors.black38,
                                fontFamily: 'Roboto Regular',
                                fontSize: 12.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      Text(
                        item.offer,
                        style: TextStyle(
                            fontFamily: 'Roboto Regular',
                            color: Colors.redAccent,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600),
                      ),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              // color: Colors.redAccent,
                              width: _width / 2.7,
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Discover ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12.0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedList(Recommended item) {
    return Container(
      width: _width / 3,
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: _height / 8,
                  child: Image.asset(
                    item.img,
                    width: _width,
                    height: _height,
                    fit: BoxFit.fill,
                  ),
                  color: Colors.grey,
                ),
                Align(
                  alignment: Alignment.topRight,
                  // child:Icon(Icons.favorite_border,color:Colors.white,),
                  child: Container(
                    margin: EdgeInsets.only(top: 5.0, right: 5.0),
                    alignment: Alignment.center,
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.transparent.withOpacity(0.5),
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            alignment: Alignment.topLeft,
            child: Text(
              item.hotelName,
              style: TextStyle(
                fontFamily: 'Roboto Medium',
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Expanded(child:Row(
            children: <Widget>[
              Container(
                // margin: EdgeInsets.only(top:5.0),
                alignment: Alignment.center,
                child: Text(
                  item.location,
                  style: TextStyle(
                    fontFamily: 'Roboto Regular',
                    fontWeight: FontWeight.w700,
                    fontSize: 11.0,
                    color: Color.fromRGBO(68, 51, 156, 1),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Icon(
                Icons.location_on,
                color: Color.fromRGBO(68, 51, 156, 1),
                size: 13.0,
              )
            ],
          )),
        ],
      ),
    );
  }
}
