import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle supermercadoOneTextStyle(
      {required Color color, double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.supermercadoOne(
        color: color, fontSize: fontSize, fontWeight: fontWeight);
  }

  static TextStyle poppinsTextStyle(
      {required Color color, double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        color: color, fontSize: fontSize, fontWeight: fontWeight);
  }

  static TextStyle ttChocolateTextStyle(
      {required Color color, double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.oldStandardTt(
        color: color, fontSize: fontSize, fontWeight: fontWeight);
  }
}
