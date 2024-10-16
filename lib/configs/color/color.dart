import 'package:flutter/material.dart';

class AppColors {
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFF4F5F9);
  static const Color borderColor = Color(0xFFEBEBEB);
  static const Color primaryColor = Color(0xFFAEDC81);
  static const Color primaryDarkColor = Color(0xFF6CC51D);
  static const Color primaryLightColor = Color(0xFFEBFFD7);
  static const Color linkColor = Color(0xFF407EC7);
  static const Color textColor = Color(0xFF868889);
  static const Color buttonShadowColor = Color(0xFF6CC51D);
  static const Color buttonColor = Colors.green;
  static const Color redColor = Colors.red;

  static const LinearGradient buttonGradient = LinearGradient(
      colors: [ primaryColor, primaryDarkColor]);

  static  BoxShadow buttonShadow = BoxShadow(
    color: buttonShadowColor.withOpacity(0.25),
    blurRadius: 9,
    offset: Offset(
      0.0, // Move to right 10  horizontally
      10.0, // Move to bottom 10 Vertically
    ),
  );
}
