
import 'package:flutter/material.dart';

class SpotColors{
  static const Color colorPrimary = Color(0xff2E3C5D);
  static const Color colorGreen =Color(0xff67CD00);
  static const Color colorBlue = Color(0xff7094E8);
  static const Color colorOrange = Color(0xffE97E00);
  static const Color colorYellow = Color(0xffFFE142);

  static const Color colorGrayLight = Color(0xffd7d4d4);

//Colors For profile
  static const Color colorProfileBackground =  Color(0xFFDAD9F4);
  static const Color colorTextField =  Color(0xFF39393D);
  static const Color colorGrayLight2 = Color(0xffc4c3c3);


  static MaterialColor getPrimaryColor(){
    return buildMaterialColor(colorPrimary);
  }

  static  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

}