import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Features/Profile/components/profile_info_item.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/Widgets/spacing_widget.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HightSpacing(hight: 16),
          Text(
            'Profile Info',
            style: AppTextStyles.primaryStyle.copyWith(fontSize: 14.sp),
          ),
          HightSpacing(hight: 8),
          ProfileInfoItemWidget(
            iconPath: 'assets/Icons/profile_icon.svg',
            itemName: 'Personal Info',
          ),
          Divider(color: Color(0xffD1DAD6)),
          ProfileInfoItemWidget(
            iconPath: 'assets/Icons/language_icon.svg',
            itemName: 'Language',
          ),
          Divider(color: Color(0xffD1DAD6)),
          ProfileInfoItemWidget(
            iconPath: 'assets/Icons/country_icon.svg',
            itemName: 'Country',
          ),
          Divider(color: Color(0xffD1DAD6)),
          ProfileInfoItemWidget(
            iconPath: 'assets/Icons/terms_icon.svg',
            itemName: 'Terms & Conditions',
          ),
          Divider(color: Color(0xffD1DAD6)),
          ProfileInfoItemWidget(
            iconPath: 'assets/Icons/logout_icon.svg',
            itemName: 'Logout',
            textColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
