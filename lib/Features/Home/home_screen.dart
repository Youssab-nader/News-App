import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/Features/Home/Models/home_controller.dart';
import 'package:news_app/Features/Home/Widgets/categories_widget.dart';
import 'package:news_app/Features/Home/Widgets/top_line_news_widget.dart';
import 'package:news_app/core/Models/article_model.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      builder: (context, child) {
        return Consumer<HomeController>(
          builder:
              (BuildContext context, HomeController controller, Widget? child) {
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
                                    padding: EdgeInsets.fromLTRB(
                                      16.w,
                                      60.h,
                                      0,
                                      0,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                            itemCount: articles.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder:
                                                (
                                                  BuildContext context,
                                                  int index,
                                                ) {
                                                  final String pubAt =
                                                      articles[index]
                                                          .publishedAt;
                                                  final String title =
                                                      articles[index].title;
                                                  return TopLineNewsWidget(
                                                    imageSrc: articles[index]
                                                        .urlToImage,
                                                    title: title,
                                                    publishedAt: pubAt,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            SizedBox(height: 16.h),
                          ],
                        ),
                );
              },
        );
      },
    );
  }
}
