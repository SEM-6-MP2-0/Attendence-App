import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class CusTextStyle {
  static const TextStyle big = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static final TextStyle large = GoogleFonts.inter(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static final TextStyle midL = GoogleFonts.inter(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: CusColors.grey,
  );
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle subTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
}
