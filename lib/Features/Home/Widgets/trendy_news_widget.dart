import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/Features/Home/Models/home_controller.dart';
import 'package:news_app/Features/Home/Widgets/top_line_news_widget.dart';
import 'package:news_app/core/Components/view_all.dart';
import 'package:news_app/core/Models/article_model.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:provider/provider.dart';

class TrendyNewsWidget extends StatelessWidget {
  const TrendyNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder:
          (BuildContext context, HomeController controller, Widget? child) {
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
                            itemCount: controller.trendyNews.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              final ArticleModel trendy =
                                  controller.trendyNews[index];
                              final String pubAt = trendy.publishedAt;
                              final String title = trendy.title;
                              return TopLineNewsWidget(
                                imageSrc: trendy.urlToImage,
                                title: title,
                                author: trendy.author,
                                publishedAt: pubAt,
                                publishedFrom: trendy.publishedFrom(),
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
          },
    );
  }
}
