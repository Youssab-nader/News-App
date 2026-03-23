import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Features/Home/Models/home_controller.dart';
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
                return Scaffold(
                  body: controller.everyThindLoading
                      ? Center(child: const CircularProgressIndicator())
                      : (controller.errorMessage != null)
                      ? Center(
                          child: Text(
                            ' ${controller.errorMessage}',
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(16.r),
                          child: ListView.builder(
                            itemCount: controller.everyThingNews.length,
                            itemBuilder: (context, index) {
                              return Text(
                                controller.everyThingNews[index].title,
                                style: AppTextStyles.primaryStyle,
                              );
                            },
                          ),
                        ),
                );
              },
        );
      },
    );
  }
}
