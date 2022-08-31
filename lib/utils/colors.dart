import 'package:flutter/material.dart';

class Colour{
  static const kDarkGrey=Color(0xff211F20);
  static const kGrey=Color(0xff303238);
  static const kWhite=Color(0xffffffff);
  static const kOrange=Color(0xffF37021);
  static const kBorderLine=Color(0xff282828);
  static const MaterialColor primaryColor=MaterialColor(0xffFFFFFF, <int,Color>{
    50 : Color(0xfff6f6f6 ),//10%
    100: Color(0xfff7f7f7),//20%
    200: Color(0xfff8f8f8),//30%
    300: Color(0xfff9f9f9),//40%
    400: Color(0xfffafafa),//50%
    500: Color(0xfffbfbfb),//60%
    600: Color(0xfffcfcfc),//70%
    700: Color(0xfffdfdfd),//80%
    800: Color(0xfffefefe),//90%
    900: Color(0xffffffff),//100%
  });
}
