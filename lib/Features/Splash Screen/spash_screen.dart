import 'package:flutter/material.dart';
import 'package:news_app/Features/Auth/auth_service.dart';
import 'package:news_app/Features/Book_Mark/main_screen.dart';
import 'package:news_app/Features/Onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});
  final bool isLogin = AuthService().isSaved();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigation();
  }

  void _navigation() async {
    await Future.delayed(Duration(seconds: 3));
    if (!mounted) return;
    widget.isLogin ? Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => MainScreen()),
    ) : Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => OnbordingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset('assets/Images/splash_image.png'),
      ),
    );
  }
}

