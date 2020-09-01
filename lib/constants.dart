import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kTextFieldColor = Colors.white;
const kGreytextColor = Color(0x0FF7c7c7c);

final kButtonDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(22.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final TextStyle kTitleTextStyle = GoogleFonts.openSans(
    color: kGreytextColor, fontSize: 24, fontWeight: FontWeight.w600);

final TextStyle kLargeTextStyle = GoogleFonts.openSans(
    color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300);

final TextStyle kLargeUnderlineTextStyle = GoogleFonts.openSans(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.underline);

final TextStyle kSmallTextStyle = GoogleFonts.openSans(
    color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300);

final TextStyle kSmallRegularTextStyle = GoogleFonts.openSans(
    color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400);

final TextStyle kSmallGreyTextStyle = GoogleFonts.openSans(
    color: kGreytextColor, fontSize: 14, fontWeight: FontWeight.w300);

final TextStyle kSmallGreyBoldTextStyle = GoogleFonts.openSans(
    color: kGreytextColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline);

final TextStyle kLabelTextStyle = GoogleFonts.openSans(
    color: kGreytextColor, fontSize: 18, fontWeight: FontWeight.w400);
