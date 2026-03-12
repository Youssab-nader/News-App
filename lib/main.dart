import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Features/Onboarding/onboarding_screen.dart';
import 'package:news_app/core/Style/app_thems.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 832),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) {
        return MaterialApp(
          title: 'News App',
          theme: AppThems.lightThem,
          debugShowCheckedModeBanner: false,
          home: const MainPage(),
        );
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnbordingScreen();
  }
}
