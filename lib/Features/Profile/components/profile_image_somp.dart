import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/Config/app_keys_config.dart';
import 'package:news_app/core/Data/Local_data/local_storage_service.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/Widgets/spacing_widget.dart';

class ProfileImage extends StatelessWidget {
   ProfileImage({super.key});
  final String userName =  PreferencesManager().getString(key: AppKeysConfig.userNameKey) ?? 'User Name';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.h,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(50.r),
                child: Image.asset(
                  'assets/Images/default_user_avatar.png',
                  width: 85.w,
                  height: 85.h,
                ),
              ),
              Positioned(
                left: 55.w,
                top: 55.h,
                child: SvgPicture.asset('assets/Icons/image_pick_icon.svg'),
              ),
            ],
          ),
          HightSpacing(hight: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(userName, style: AppTextStyles.primaryStyle)],
          ),
        ],
      ),
    );
  }
}
