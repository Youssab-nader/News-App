import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/Features/Home/Models/home_controller.dart';
import 'package:news_app/Features/Home/Widgets/categories_widget.dart';
import 'package:news_app/Features/Home/Widgets/top_line_news_widget.dart';
import 'package:news_app/core/Models/article_model.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/Widgets/spacing_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      builder: (context, child) {
        return Consumer<HomeController>(
          builder: (BuildContext context, HomeController controller, Widget? child) {
            final List<ArticleModel> trendingNews = controller.topHeadLineNews;
            final List<ArticleModel> articles = controller.everyThingNews;

            return Scaffold(
              body: (controller.everyThindLoading)
                  ? Center(child: const CircularProgressIndicator())
                  : (controller.errorMessage != null)
                  ? Center(child: Text(' ${controller.errorMessage}'))
                  : Column(
                      children: [
                        SizedBox(
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Trending News',
                                          style: AppTextStyles.skipText
                                              .copyWith(
                                                color: AppColors.whiteTexts,
                                              ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'View all',
                                            style: AppTextStyles.underLined,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.h),
                                    SizedBox(
                                      height: 140.h,
                                      width: double.infinity,
                                      child: ListView.builder(
                                        itemCount: trendingNews.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                              final ArticleModel trendy =
                                                  trendingNews[index];
                                              final String pubAt =
                                                  trendy.publishedAt;
                                              final String title = trendy.title;
                                              return TopLineNewsWidget(
                                                imageSrc: trendy.urlToImage,
                                                title: title,
                                                publishedAt: pubAt,
                                                publishedFrom: trendy
                                                    .publishedFrom(),
                                              );
                                            },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Categories',
                                style: AppTextStyles.skipText.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'View all',
                                  style: AppTextStyles.underLined.copyWith(
                                    color: Colors.black,
                                    decorationColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CategoriesWidget(),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              final ArticleModel dailyNews = articles[index];
                              return Container(
                                width: 343.w,
                                height: 70.h,
                                margin: EdgeInsets.all(16.r),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(8.r),
                                      child: Image.network(
                                        dailyNews.urlToImage,
                                        width: 122.w,
                                        height: 68.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    WidthSpacing(width: 8),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            dailyNews.title,
                                            maxLines: 2,
                                            style: AppTextStyles.primaryStyle
                                                .copyWith(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                // width: 80.w,
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/Images/cnn_logo.png',
                                                      width: 20.w,
                                                      height: 20.h,
                                                    ),
                                                    SizedBox(width: 4.w),
                                                    Text(
                                                      'CNN News',
                                                      style: AppTextStyles
                                                          .newsChanelStyle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 6.w),
                                              Text(
                                                dailyNews.publishedFrom(),
                                                style: AppTextStyles
                                                    .newsChanelStyle,
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  controller.setBookMark(index);
                                                },
                                                child: dailyNews.isBookMarked
                                                    ? SvgPicture.asset(
                                                        'assets/Icons/active_book_mark_icon.svg',
                                                      )
                                                    : SvgPicture.asset(
                                                        'assets/Icons/book_mark_icon.svg',
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
                            },
                          ),
                        ),
                      ],
                    ),
            );
          },
        );
      },
    );
  }
}
