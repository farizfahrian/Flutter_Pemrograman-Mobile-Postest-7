import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color mainColor = Colors.blue;
Color primaryColor = Colors.black;
Color secondaryColor = Color(0xff010617);
Color successColor = Color(0xff43936C);
Color alertColor = Color(0xffED6363);
Color backgroundColor = Color(0xffB0B0B0);

TextStyle primaryTextStyle = GoogleFonts.inter(
  color: primaryColor,
);

TextStyle secondaryTextStyle = GoogleFonts.inter(
  color: secondaryColor,
);

TextStyle grayTextStyle = GoogleFonts.inter(
  color: backgroundColor,
);

TextStyle priceTextStyle = GoogleFonts.inter(
  color: mainColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

double defaultMargin = 30;
