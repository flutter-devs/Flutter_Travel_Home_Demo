import 'package:flutter/material.dart';
import 'package:travel_homepage_moduel/model/dailydeals_model.dart';
import 'package:travel_homepage_moduel/model/five_star_hotel.dart';
import 'package:travel_homepage_moduel/model/onboarding_model.dart';
import 'package:travel_homepage_moduel/model/recommended_model.dart';

class Constants{

  static final String ONBOARDING_SPLASH='ONBOARDING_SPLASH';
  static final String HOME='HOME';
  static final String SPLASH_SCREEN='SPLASH_SCREEN';

  static List<DailyDeals>getDailyDealsList(){
    return[
      DailyDeals('assets/images/goaBeach.jpg','Bilagio','5 Stars','Las vegas', '4.9','(569 reviews)','Book & save 20%!'),
      DailyDeals('assets/images/getRadyForSummer.jpg','Bilagio','5 Stars','Las vegas', '4.9','(569 reviews)','Book & save 20%!'),
      DailyDeals('assets/images/goaBeach.jpg','Bilagio','5 Stars','Las vegas', '4.9','(569 reviews)','Book & save 20%!'),
    ];
  }

  static List<Recommended>getRecommendedList(){
    return[
      Recommended('assets/images/sydney.jpeg','APA hotel','Las Vegas'),
      Recommended('assets/images/recomn_img.jpeg','Ottoman','Las Vegas'),
      Recommended('assets/images/getRadyForSummer.jpg','Hotel Duo','Las Vegas'),
      Recommended('assets/images/goaBeach.jpg','The Cromwell','Las Vegas'),
    ];
  }
  
  static List<FiveStarHotel>getFiveStarHotelList(){
    return[
      FiveStarHotel('assets/images/hill.jpeg','Skylofts hotel','Las Vegas'),
      FiveStarHotel('assets/images/bangkok.jpg','Waldrof hotel','Bangkok'),
      FiveStarHotel('assets/images/london.jpg','The Palazzo hotel','London'),
      FiveStarHotel('assets/images/istanbul.jpeg','Vdara hotel','Istanbul'),
    ];
  }

  static List<OnBoardingModel>getBoardingList(){
    return[
      OnBoardingModel('assets/images/2.png','Enjoy Your Trip','User onboarding is a very important feature when you have a bunch of cool '),
      OnBoardingModel('assets/images/Untitled-1.png','Create the Journey of your dreams','User onboarding is a very important feature when you have a bunch of cool '),
      OnBoardingModel('assets/images/Untitled-3.png','Easy to find flights and book hotels','User onboarding is a very important feature when you have a bunch of cool  '),
    ];
  }
}


