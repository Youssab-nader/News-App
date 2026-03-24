import 'package:flutter/material.dart';
import 'package:news_app/Features/Auth/login_screen.dart';
import 'package:news_app/Features/Onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => OnbordingScreen()),
    );
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

