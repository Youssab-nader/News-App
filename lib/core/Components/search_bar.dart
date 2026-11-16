import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Models/article_model.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/controllers/main_controller.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.textController,
    this.onPressed,
  });
  final TextEditingController textController;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Consumer<MainController>(
      builder:
          (BuildContext context, MainController controller, Widget? child) {
            return TextField(
              controller: textController,
              cursorColor: AppColors.primaryText,
              decoration: InputDecoration(
                hintText: "Search",
                filled: true,
                fillColor: AppColors.whiteTexts,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
                hintStyle: AppTextStyles.primaryStyle.copyWith(
                  color: AppColors.secondaryText,
                ),
                errorStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){
                    controller.searching(textController.text) ;
                  },
                ),
              ),
            );
          },
    );
  }
}
