import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/Features/Profile/profile_data_controller.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/Widgets/spacing_widget.dart';
import 'package:provider/provider.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});
  @override
  Widget build(BuildContext context) {
  
    return Consumer<ProfileDataController>(
      builder:
          (
            BuildContext context,
            ProfileDataController controller,
            Widget? child,
          ) {
            final String userName = controller.userName ?? '';
            return SizedBox(
              height: 125.h,
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(50.r),
                        child: (controller.userProfileImage == null)
                            ? Image.asset(
                                'assets/Images/default_user_avatar.png',
                                fit: BoxFit.cover,
                                width: 85.w,
                                height: 85.h,
                              )
                            : Image.file(
                                controller.userProfileImage!,
                                fit: BoxFit.cover,
                                width: 85.w,
                                height: 85.h,
                              ),
                      ),
                      Positioned(
                        left: 55.w,
                        top: 55.h,
                        child: InkWell(
                          onTap: () {
                            controller.pickProfileImage();
                          },
                          child: SvgPicture.asset(
                            'assets/Icons/image_pick_icon.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                  HightSpacing(hight: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(userName, style: AppTextStyles.primaryStyle),
                    ],
                  ),
                ],
              ),
            );
          },
    );
  }
}
