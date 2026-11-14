import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/Features/Home/Models/home_controller.dart';
import 'package:news_app/Features/Home/Widgets/categories_widget.dart';
import 'package:news_app/Features/Home/Widgets/custom_cashed_network_image.dart';
import 'package:news_app/core/Models/article_model.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/Widgets/spacing_widget.dart';
import 'package:news_app/core/extensions/format_date_extension.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Categories')),
      body: Consumer<HomeController>(
        builder: (BuildContext context, HomeController controller, Widget? child) {
          return Column(
            children: [
              CategoriesWidget(),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.dailyNews.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ArticleModel dailyNews = controller.dailyNews[index];
                    return Container(
                      width: 343.w,
                      height: 70.h,
                      margin: EdgeInsets.all(16.r),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(8.r),
                            child: CustomCashedNetworkImage(
                              imagePath: dailyNews.urlToImage,
                            ),
                          ),
                          WidthSpacing(width: 8),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  dailyNews.title,
                                  maxLines: 2,
                                  style: AppTextStyles.primaryStyle.copyWith(
                                    overflow: TextOverflow.ellipsis,
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
                                            style: AppTextStyles.newsChanelStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    Text(
                                      dailyNews.publishedAt.formatDate(),
                                      style: AppTextStyles.newsChanelStyle,
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
          );
        },
      ),
    );
  }
}
