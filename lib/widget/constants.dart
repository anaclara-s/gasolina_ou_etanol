import 'package:flutter/material.dart';

const kLightStandardColor = Color.fromARGB(207, 140, 199, 193);
const kDarkStandardColor = Color.fromARGB(255, 13, 168, 155);

const kLightTextColor = Colors.black;
const kDarkTextColor = Colors.white;

class Constants {
  static Color getStandardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? kLightStandardColor
        : kDarkStandardColor;
  }

  static Color getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? kLightTextColor
        : kDarkTextColor;
  }
}
