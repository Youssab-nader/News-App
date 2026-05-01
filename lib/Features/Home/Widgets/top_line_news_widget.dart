import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Style/app_text_styles.dart';

class TopLineNewsWidget extends StatelessWidget {
  final String imageSrc;
  final String title;
  final String publishedAt;
  const TopLineNewsWidget({
    super.key,
    required this.imageSrc,
    required this.title,
    required this.publishedAt,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 235.w,
      height: 140.h,
      margin: EdgeInsets.only(left: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8.r),
            child: Image.network(
              imageSrc,
              width: 235.w,
              height: 140.h,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 40.h, 10.w, 10.h),
            child: Column(
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.buttonText.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      // width: 80.w,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/Images/cnn_logo.png',
                            width: 30.w,
                            height: 30.h,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'CNN News',

                            style: AppTextStyles.buttonText.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      publishedFrom(),
                      style: AppTextStyles.buttonText.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String publishedFrom() {
    DateTime publishedTime = DateTime.parse(publishedAt);
    DateTime now = DateTime.now().toUtc();
    Duration diff = now.difference(publishedTime);
    if (diff.inSeconds < 60) {
      return "Just now";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} minutes ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} hours ago";
    } else {
      return "${diff.inDays} days ago";
    }
  }
}
