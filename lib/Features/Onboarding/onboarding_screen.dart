import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Features/Auth/login_screen.dart';
import 'package:news_app/Features/Onboarding/Models/onboarding_controller.dart';
import 'package:news_app/Features/Onboarding/Models/onboarding_widgets_model.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/Widgets/index_viewer_widget.dart';
import 'package:provider/provider.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Home REBUILD');
    return ChangeNotifierProvider(
      create: (BuildContext context) => OnboardingController(),
      builder: (context, child) {
        return Scaffold(
          
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TextButton(
                  onPressed: () {
                    controller.jumpToPage(2);
                  },
                  child: Consumer(
                    builder:
                        (
                          BuildContext context,
                          OnboardingController onboardingController,
                          Widget? child,
                        ) {
                          return Text(
                            (onboardingController.pageIndex == 2) ? '' : 'Skip',
                            style: AppTextStyles.skipText,
                          );
                        },
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 540.h,
                  child: Consumer(
                    builder:
                        (
                          BuildContext context,
                          OnboardingController onboardingController,
                          Widget? child,
                        ) {
                          return PageView.builder(
                            controller: controller,
                            itemCount:
                                OnboardingWidgetsModel.onboardingWidgets.length,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (int value) {
                              onboardingController.pageChanged(value);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    OnboardingWidgetsModel
                                        .onboardingWidgets[index]
                                        .photoPath,
                                  ),
                                  SizedBox(height: 24.h),
                                  Text(
                                    OnboardingWidgetsModel
                                        .onboardingWidgets[index]
                                        .headTitle,
                                    style: AppTextStyles.splashTop,
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    OnboardingWidgetsModel
                                        .onboardingWidgets[index]
                                        .subTitle,
                                    style: AppTextStyles.primaryStyle,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                  ),
                ),
                IndexViewerWidget(),
                Spacer(),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 20.h),
                  child: Consumer(
                    builder:
                        (
                          BuildContext context,
                          OnboardingController onboardingController,
                          Widget? child,
                        ) {
                          return ElevatedButton(
                            onPressed: (onboardingController.pageIndex != 2)
                                ? () {
                                    controller.nextPage(
                                      duration: Durations.medium1,
                                      curve: Curves.ease,
                                    );
                                  }
                                : () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginScreen(),
                                      ),
                                    );
                                  },
                            child: Text(
                              (onboardingController.pageIndex == 2)
                                  ? 'Get Started'
                                  : 'Next',
                              style: AppTextStyles.buttonText,
                            ),
                          );
                        },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
