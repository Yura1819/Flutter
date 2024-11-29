import 'package:flutter/material.dart';

class ScreenSettings {

  static late MediaQueryData _mediaQueryData; 

  static late double logoSize; 

  static late double spacing; 

  static late double fontSize; 

  static late EdgeInsets padding; 

  static void init(BuildContext context) {

    _mediaQueryData = MediaQuery.of(context); 

    final bool isLandscape = _mediaQueryData.size.width > _mediaQueryData.size.height; 

    logoSize = _mediaQueryData.size.width < 600 ? 80.0 : 120.0; 

    spacing = _mediaQueryData.size.height / (isLandscape ? 40 : 30); 

    fontSize = _mediaQueryData.size.width < 600 ? 20.0 : 24.0; 

    padding = _mediaQueryData.size.width < 600
        ? const EdgeInsets.symmetric(horizontal: 20) 
        : EdgeInsets.symmetric(horizontal: _mediaQueryData.size.width * 0.3); 
  }
}
