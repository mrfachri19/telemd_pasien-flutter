import 'package:flutter/material.dart';

class Dimensions {
  static MediaQueryData _mediaQueryData = const MediaQueryData();
  static double screenHeight = _mediaQueryData.size.height;
  static double screenWidth = _mediaQueryData.size.width;

  static double pageViewContainer = screenHeight / 3.84;
  static double pageView = screenHeight / 2;
  static double pageViewTextContainer = screenHeight / 7.03;
  //dynamic height padding and margin
  static double height5 = screenHeight / 157;
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height25 = screenHeight / 32.46;
  static double height30 = screenHeight / 28.13;
  static double height40 = screenHeight / 20;
  static double height45 = screenHeight / 18.76;
  static double height50 = screenHeight / 15.9;
  static double height55 = screenHeight / 14.22;
  static double height70 = screenHeight / 11.11;
  static double height100 = screenHeight / 7.8;
  static double height320 = screenHeight / 2.5;

  //dynamic width padding and margin
  static double width5 = screenHeight / 157;
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.76;
  static double width70 = screenHeight / 11.11;
  static double width100 = screenHeight / 7.8;

  //dynamic font size
  static double font10 = screenHeight / 79.2;
  static double font14 = screenHeight / 60.95;
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font24 = screenHeight / 34.13;
  static double font26 = screenHeight / 32.46;

  //radius
  static double radius10 = screenHeight / 79.2;
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;
  static double radius60 = screenHeight / 14.22;

  //icon size
  static double iconSize48 = screenHeight / 13.33;
  static double iconSize32 = screenHeight / 20;
  static double iconSize28 = screenHeight / 22.85;
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;
  static double iconSize12 = screenHeight / 53.33;
  static double iconSize8 = screenHeight / 80;

  //list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  //popular food
  static double popularFoodImgSize = screenHeight / 2.41;

  //bottom height
  static double bottomHeightBar = screenHeight / 7.03;

  init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;

    pageViewContainer = screenHeight / 3.84;
    pageView = screenHeight / 2;
    pageViewTextContainer = screenHeight / 7.03;
    //dynamic height padding and margin
    height10 = screenHeight / 84.4;
    height15 = screenHeight / 56.27;
    height20 = screenHeight / 42.2;
    height30 = screenHeight / 28.13;
    height45 = screenHeight / 18.76;
    //dynamic width padding and margin
    width10 = screenHeight / 84.4;
    width15 = screenHeight / 56.27;
    width20 = screenHeight / 42.2;
    width30 = screenHeight / 28.13;
    width45 = screenHeight / 18.76;
    //dynamic font size
    font14 = screenHeight / 60.95;
    font16 = screenHeight / 52.75;
    font20 = screenHeight / 42.2;
    font26 = screenHeight / 32.46;
    //radius
    radius15 = screenHeight / 56.27;
    radius20 = screenHeight / 42.2;
    radius30 = screenHeight / 28.13;
    radius60 = screenHeight / 14.22;

    //icon size
    iconSize48 = screenHeight / 13.33;
    iconSize32 = screenHeight / 20;
    iconSize28 = screenHeight / 22.85;
    iconSize24 = screenHeight / 35.17;
    iconSize16 = screenHeight / 52.75;
    iconSize12 = screenHeight / 53.33;
    iconSize8 = screenHeight / 80;

    //list view size
    listViewImgSize = screenWidth / 3.25;
    listViewTextContSize = screenWidth / 3.9;

    //popular food
    popularFoodImgSize = screenHeight / 2.41;

    //bottom height
    bottomHeightBar = screenHeight / 7.03;
  }
}
