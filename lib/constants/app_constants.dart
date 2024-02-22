import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appTextStyle({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) =>
    GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );

Widget setHeight(double height) => SizedBox(height: height);

Widget setWidth(double width) => SizedBox(width: width);

BorderRadius get textFieldBorderRadius => BorderRadius.circular(5);
