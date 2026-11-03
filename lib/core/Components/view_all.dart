import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';

class ViewAllComponent extends StatelessWidget {
  const ViewAllComponent({
    super.key,
    required this.title,
    this.textColor,
    this.onTap,
  });
  final String title;
  final Color? textColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.skipText.copyWith(
                color: textColor ?? AppColors.whiteTexts,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
              onPressed: () {},
              child: Text(
                'View all',
                style: AppTextStyles.underLined.copyWith(
                  color: textColor ?? AppColors.whiteTexts,
                  decorationColor: textColor ?? AppColors.whiteTexts,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
