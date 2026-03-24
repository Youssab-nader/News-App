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

  static final TextStyle primaryStyle = TextStyle(
    fontSize: 16.sp,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w400,
  );
}
