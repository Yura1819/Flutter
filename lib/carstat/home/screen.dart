import 'package:flutter/material.dart'; // Імпортуємо необхідну бібліотеку для використання компонентів Flutter.

class ScreenSet { 

  static double getIconSize(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return screenWidth < 600 ? 24.0 : 30.0;
  }
}
