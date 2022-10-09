import 'package:flutter/material.dart';

const kListItemTextStyle = TextStyle(
    fontFamily: 'AbyssinicaSIL',
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    // color: Color(0xFFB71C1C
    color:Colors.black);
    
const kAppBarTextStyle = TextStyle(
    fontFamily: 'AbyssinicaSIL', fontWeight: FontWeight.bold, fontSize: 22.0,);
const kNormalTextStyle = TextStyle(
    fontFamily: 'AbyssinicaSIL',  fontSize: 16.0, wordSpacing: 2, height: 1.5);

const MaterialColor kPrimaryLight = MaterialColor(
  0xffff7643, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: Color(0xffffebee), //10%
    100: Color(0xffffcdd2), //20%
    200: Color(0xffef9a9a), //30%
    300: Color(0xffe57373), //40%
    400: Color(0xffef5350), //50%
    500: Color(0xfff44336), //60%
    600: Color(0xffe53935), //70%
    700: Color(0xffd32f2f), //80%
    800: Color(0xffc62828), //90%
    900: Color(0xffb71c1c), //100%
  },
);