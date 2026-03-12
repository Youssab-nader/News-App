import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Features/Onboarding/Models/onboarding_controller.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:provider/provider.dart';

class IndexViewerWidget extends StatelessWidget {
  const IndexViewerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print('Index REBUILD');
    final int index = context.watch<OnboardingController>().pageIndex;
    return SizedBox(
      width: 55.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 14.w,
            height: 14.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (index == 0) ? AppColors.primary : AppColors.greyD3D,
            ),
          ),
          Container(
            width: 14.w,
            height: 14.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (index == 1) ? AppColors.primary : AppColors.greyD3D,
            ),
          ),
          Container(
            width: 14.w,
            height: 14.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (index == 2) ? AppColors.primary : AppColors.greyD3D,
            ),
          ),
        ],
      ),
    );
  }
}
