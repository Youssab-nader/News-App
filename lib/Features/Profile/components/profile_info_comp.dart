import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Features/Auth/login_screen.dart';
import 'package:news_app/Features/Profile/components/edit_profile_info_bt.dart';
import 'package:news_app/Features/Profile/components/profile_info_item.dart';
import 'package:news_app/Features/Profile/profile_data_controller.dart';
import 'package:news_app/core/Data/Local_data/local_storage_service.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/Widgets/spacing_widget.dart';
import 'package:provider/provider.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileDataController>(
      builder:
          (
            BuildContext context,
            ProfileDataController controller,
            Widget? child,
          ) {
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
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (BuildContext context) =>
                            EditProfileInfoBootmSheet(),
                      ).then((value) {
                        controller.getUserData();
                      });
                    },
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
                    onTap: () {
                      PreferencesManager().clear();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
    );
  }
}
