import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:travel_homepage_moduel/Screen/home_screen.dart';
import 'package:travel_homepage_moduel/constant/constants.dart';
import 'package:travel_homepage_moduel/model/onboarding_model.dart';

class OnboardingSplash extends StatefulWidget {
  @override
  _OnboardingSplashState createState() => _OnboardingSplashState();
}

class _OnboardingSplashState extends State<OnboardingSplash> {
  double _height;
  double _width;

  int currentPageValue =  0;

  PageController controller;

  /*final List<Widget> onBoardingPageList = <Widget>[

  ];*/

  List<OnBoardingModel> onBoardingList;

  @override
  void initState() {
    super.initState();
    onBoardingList = Constants.getBoardingList();
    currentPageValue = 0;
    controller = PageController(initialPage: 0);
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        //color:Colors.indigoAccent,
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: onBoardingList.length,
                  onPageChanged: (int page) {
                    getChangedPageAndMoveBar(page);
                  },
                  controller: controller,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildOnboardingList(onBoardingList[index], index);
                  }),
            ),
            Visibility(
              visible: currentPageValue == onBoardingList.length - 1 ? false : true,
              child: Container(
                margin:EdgeInsets.only(top:40.0),
              //  color:Colors.cyan,
                width: _width,
                //height:_height/1.5,
                //margin: EdgeInsets.only(top:10.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    //  crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          for (int i = 0; i < onBoardingList.length; i++)
                            if (i == currentPageValue) ...[circleBar(true)] else
                              circleBar(false),
                        ],
                      ),

                      //SizedBox(width: 100.0,),
                      FlatButton(
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: Color.fromRGBO(68, 51, 156, 1),
                                fontFamily: ('Roboto Medium'),
                                fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            int page = currentPageValue + 1;
                            controller.animateToPage(page,
                                duration: Duration(seconds: 1), curve: Curves.easeOut);
                            currentPageValue = page;
                          }),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height:20,
            ),
            Visibility(
              visible:
                  currentPageValue == onBoardingList.length - 1 ? true : false,

              // visible:currentPageValue == onBoardingList.length?true:false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(left: 10.0, right: 10.0,bottom:20.0),
                  child: ButtonTheme(
                    minWidth: _width,
                    height: _height / 16,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: RaisedButton(
                      color: Color.fromRGBO(68, 51, 156, 1),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      },
                      child: Text(
                        'GET STARTED',
                        style: TextStyle(
                            fontFamily: 'Roboto Medium',
                            fontSize: 16.0,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? Color.fromRGBO(68, 51, 156, 1) : Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }

  Widget _buildOnboardingList(OnBoardingModel item, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: _height / 1.8,
                width: _width,
                color: Color.fromRGBO(68, 51, 156, 1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:30.0),
              child: Align(
                alignment: Alignment.topRight,
                child: FlatButton(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: ('Roboto Medium'),
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    }
                    ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // color:Colors.yellow,
                margin: EdgeInsets.only(top: 100.0),

                child: Image.asset(
                  item.img,
                  fit: BoxFit.fill,
                  height: _height / 2.8,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Text(item.title,
              style: TextStyle(
                  fontFamily: 'Roboto Regular',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0)),
        ),
        Container(
          // color: Colors.indigoAccent,
          width: _width / 1.3,
          margin: EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            item.subTitle,
            style: TextStyle(
                fontFamily: 'Roboto Medium',
                fontWeight: FontWeight.w500,
                height: 1.2),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
