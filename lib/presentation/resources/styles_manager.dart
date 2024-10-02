import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// Black Style
TextStyle getBlackStyle({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.black, color);
}

// Bold Style
TextStyle getBoldStyle({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// ExtraBold Style
TextStyle getExtraBoldStyle({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.extraBold, color);
}

// ExtraLight Style
TextStyle getExtraLightStyle({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.extraLight, color);
}

// ExtraLight Style
TextStyle getLightStyle({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// Medium Style
TextStyle getMediumStyle({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// Regular Style
TextStyle getRegularStyle({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}
