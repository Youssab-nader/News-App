import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_fonts.dart';

class AppThems {
  static ThemeData lightThem = ThemeData(
    scaffoldBackgroundColor: AppColors.backGroungF5,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.backGroungF5),
    fontFamily: AppFonts.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        fixedSize: Size(343.w, 48.h),
        side: BorderSide(style: BorderStyle.none),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(0),
        ),
      ),
    ),
  );
}
