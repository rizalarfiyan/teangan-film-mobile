import 'package:flutter/material.dart';

class ColorItem {
  static var white = hexToColor("#FFFFFF");
  static var black = hexToColor("#000000");

  static var red = hexToColor("#F25F5C");
  static var red5 = hexToColor("#f1504d");

  static Color hexToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16) + 0xFF000000);
  }
}
