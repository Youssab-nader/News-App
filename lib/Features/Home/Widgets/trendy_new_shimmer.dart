import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/Components/view_all.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class TrendyNewsShimmer extends StatelessWidget {
  const TrendyNewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/Images/home_header_background.png',
            height: 242.h,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 60.h, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Icons/texted_logo.svg',
                  height: 17.h,
                  width: 83.w,
                ),
                SizedBox(height: 16.h),
                ViewAllComponent(
                  title: 'Trendy News',
                  textColor: AppColors.whiteTexts,
                ),
                SizedBox(
                  height: 140.h,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade800,
                          highlightColor: Colors.grey.shade600,
                          child: Container(
                            height: 140,
                            width: 240,
                            color: AppColors.whiteTexts,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
