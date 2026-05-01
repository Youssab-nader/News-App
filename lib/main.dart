import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Features/Auth/auth_service.dart';
import 'package:news_app/Features/Book_Mark/main_screen.dart';
import 'package:news_app/Features/Splash%20Screen/spash_screen.dart';
import 'package:news_app/core/Data/Local_data/local_storage_service%20copy.dart';
import 'package:news_app/core/Style/app_thems.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager().init();
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
          home:  MainPage(),
        );
      },
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final bool isLogin = AuthService().isSaved();
  @override
  Widget build(BuildContext context) {
    return isLogin ? MainScreen() : SplashScreen();
  }
}
