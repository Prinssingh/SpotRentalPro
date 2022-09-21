
import 'package:flutter/material.dart';

class SpotColors{
  static const Color colorPrimary = Color(0xff2E3C5D);
  static Color colorGreen =const Color(0xff67CD00);
  static Color colorBlue =const Color(0xff7094E8);
  static Color colorOrange =const Color(0xffE97E00);
  static Color colorYellow =const Color(0xffFFE142);

  static Color colorGrayLight =const Color(0xffd7d4d4);


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