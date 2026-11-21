import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/Features/Home/Widgets/custom_cashed_network_image.dart';
import 'package:news_app/core/Models/article_model.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/Widgets/spacing_widget.dart';
import 'package:news_app/core/extensions/format_date_extension.dart';

class NewsDeataolsScreen extends StatelessWidget {
  const NewsDeataolsScreen({super.key, required this.model});
  final ArticleModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('News Details')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CustomCashedNetworkImage(
                  imagePath: model.urlToImage,
                  height: 230.h,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  model.title,
                  style: AppTextStyles.splashTop.copyWith(
                    color: AppColors.primaryText,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    // width: 80.w,
                    child: Row(
                      children: [
                        ClipOval(
                          child: CustomCashedNetworkImage(
                            imagePath: model.urlToImage,
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          model.author,
                          style: AppTextStyles.newsChanelStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 24.w),
                  Text(
                    model.publishedAt.formatDate(),
                    style: AppTextStyles.newsChanelStyle,
                  ),
                  Spacer(),
                  InkWell(
                    child: model.isBookMarked
                        ? SvgPicture.asset(
                            'assets/Icons/active_book_mark_icon.svg',
                          )
                        : SvgPicture.asset('assets/Icons/book_mark_icon.svg'),
                  ),
                ],
              ),
              HightSpacing(hight: 12),
              Text(model.description, style: AppTextStyles.primaryStyle),
            ],
          ),
        ),
      ),
    );
  }
}
