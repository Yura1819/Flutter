import 'package:flutter/material.dart';

class ScreenProf {

  static double avatarRadius(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width; 

    return screenWidth < 600 ? 40 : 80;
  }

  static double fontSize(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return screenWidth < 600 ? 16 : 24;
  }

  static EdgeInsets padding(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return screenWidth < 600
        ? const EdgeInsets.symmetric(vertical: 20, horizontal: 16)
        : const EdgeInsets.symmetric(vertical: 30, horizontal: 32);
  }
}
