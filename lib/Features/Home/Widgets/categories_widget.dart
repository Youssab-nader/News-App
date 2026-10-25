import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Features/Home/Models/home_controller.dart';
import 'package:news_app/core/Data/Enums/category_enum.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder:
          (BuildContext context, HomeController controller, Widget? child) {
            return SizedBox(
              height: 50.h,
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 12.w),
                itemCount: Categories.values.length,
                itemBuilder: (BuildContext context, int index) {
                  Categories currentCat = Categories.values[index];
                  bool isSelected =
                      currentCat == controller.selectedCategory;
                  return Container(
                    // padding: EdgeInsets.only(bottom: 2.h),
                    decoration: isSelected
                        ? BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.primary,
                                width: 2,
                              ),
                            ),
                          )
                        : null,
                    child: TextButton(
                      onPressed: () {
                        controller.categoryChanged(currentCat);
                      },
                      child: Text(
                        currentCat.title,
                        style: isSelected
                            ? AppTextStyles.selectedCategoryStyle
                            : AppTextStyles.unSelectedCategoryStyle,
                      ),
                    ),
                  );
                  // : TextButton(
                  //     onPressed: () {
                  //       controller.selectedCategory =
                  //           Categories.values[index];
                  //     },
                  //     child: Text(
                  //       Categories.values[index].title,
                  //       style: AppTextStyles.unSelectedCategoryStyle,
                  //     ),
                  //   );
                },
              ),
            );
          },
    );
  }
}
