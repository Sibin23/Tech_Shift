import 'package:flutter/material.dart';

const white = Colors.white;
const black = Colors.black;
final appThemePurple800 = Colors.purple.shade800;
const appThemeColor2 = Colors.blue;
const red = Colors.red;
const  green = Colors.green;
const purple = Colors.purple;
const grey = Colors.grey;
// hsl color #133167 assign this in flutter
final appPrimary1 = hexToColor('162a2c');
final appPrimary2 = hexToColor('686867');
final appPrimary3 = hexToColor('5E6c58');
final appPrimary4 = hexToColor('d6e0e2');
final appPrimary5 = hexToColor('f4efe6');
final appPrimary6 = hexToColor('fefcf6');

const textfieldWhite = Color.fromRGBO(243, 243, 243, 1);
final textfieldBlack = Colors.grey.shade900;

Color hexToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}