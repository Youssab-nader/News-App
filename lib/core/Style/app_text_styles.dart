import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Style/app_colors.dart';

class AppTextStyles {
  static final TextStyle buttonText = TextStyle(
    fontSize: 16.sp,
    color: AppColors.whiteTexts,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle splashTop = TextStyle(
    fontSize: 20.sp,
    color: AppColors.grey4E4,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle skipText = TextStyle(
    fontSize: 14.sp,
    color: AppColors.primary,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle underLined = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteTexts,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.whiteTexts,
    decorationThickness: 2,
    decorationStyle: TextDecorationStyle.solid,
  );

  static final TextStyle selectedLabelStyle = TextStyle(
    fontSize: 12.sp,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle unselectedLabelStyle = TextStyle(
    fontSize: 12.sp,
    color: AppColors.secondaryText,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle primaryStyle = TextStyle(
    fontSize: 16.sp,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w400,
  );
}
