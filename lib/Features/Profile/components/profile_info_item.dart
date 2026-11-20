import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/Widgets/spacing_widget.dart';

class ProfileInfoItemWidget extends StatelessWidget {
  const ProfileInfoItemWidget({
    super.key,
    required this.iconPath,
    required this.itemName,
    this.textColor,
  });
  final String iconPath;
  final String itemName;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: 343.w,
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          WidthSpacing(width: 16),
          Text(
            itemName,
            style: AppTextStyles.primaryStyle.copyWith(
              color: textColor ?? AppColors.primaryText,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: textColor),
        ],
      ),
    );
  }
}
