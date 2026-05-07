import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Data/Enums/category_enum.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  Categories selectedCategory = Categories.values[0];
  @override
  Widget build(BuildContext context) {
    print(selectedCategory.title);
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 12.w),
        itemCount: Categories.values.length,
        itemBuilder: (BuildContext context, int index) {
          return (Categories.values[index] == selectedCategory)
              ? Container(
                  // padding: EdgeInsets.only(bottom: 2.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.primary, width: 2),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = Categories.values[index];
                      });
                    },
                    child: Text(
                      Categories.values[index].title,
                      style: AppTextStyles.selectedCategoryStyle,
                    ),
                  ),
                )
              : TextButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = Categories.values[index];
                    });
                  },
                  child: Text(
                    Categories.values[index].title,
                    style: AppTextStyles.unSelectedCategoryStyle,
                  ),
                );
        },
      ),
    );
  }
}
