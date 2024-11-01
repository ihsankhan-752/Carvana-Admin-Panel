import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

class AppTextStyles {
  static TextStyle logoTextStyle = GoogleFonts.josefinSans(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  );
  static TextStyle h1 = GoogleFonts.josefinSans(
    fontSize: 16.0,
    color: AppColors.primaryBlack,
  );
  static TextStyle h1Bold = const TextStyle(
    fontSize: 16.0,
    color: AppColors.primaryBlack,
    fontWeight: FontWeight.bold,
  );
  static TextStyle h2 = const TextStyle(
    fontSize: 16.0,
    color: AppColors.primaryBlack,
  );
}
