import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyling {
  TextStyling._();

  static TextStyle extraBold = GoogleFonts.poppins(
      fontWeight: FontWeight.w800, fontSize: 16.sp, color: Colors.black);
  static TextStyle bold = GoogleFonts.poppins(
      fontWeight: FontWeight.w700, fontSize: 16.sp, color: Colors.black);
  static TextStyle semiBold = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.black);
  static TextStyle medium = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black);
  static TextStyle regular = GoogleFonts.poppins(
      fontWeight: FontWeight.w400, fontSize: 16.sp, color: Colors.black);
  static TextStyle thin = GoogleFonts.poppins(
      fontWeight: FontWeight.w300, fontSize: 16.sp, color: Colors.black);
}
