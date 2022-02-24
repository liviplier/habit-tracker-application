import 'package:flutter/material.dart';

class AppColors {
  static const Color mainColor = Color.fromRGBO(148, 180, 255, 0.9);
  // main color
  static const Color blackWithOpacity = Colors.black54;
  static Color greyWithOpacity = Colors.grey.withOpacity(0.5);
  static const Color whiteWitOpacity = Colors.white54;

  static const Color lightMode = Colors.white; // back color light mode
  static const Color lightText1 = Color(0x00000000); // black for light mode
  static const Color lightText2 = Color(0xFF878693); //grey for light theme

  static const Color darkMode = Color(0x12121212); // back color dark mode
  static const Color darkText2 = Color.fromRGBO(148, 180, 255, 0.6);
  // main color with some opacity for dark mode text
  static const Color darkText1 = Colors.white70; //white text for dark mode

// pad from left 20 pad from right 20
//     Size size = MediaQuery.of(context).size; full width size
}
