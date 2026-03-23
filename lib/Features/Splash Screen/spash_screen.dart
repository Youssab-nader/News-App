import 'package:flutter/material.dart';
import 'package:news_app/Features/Auth/Sign_in/login_screen.dart';
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
    await Future.delayed(Duration(seconds: 4));
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => OnbordingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
<<<<<<< HEAD
      body: SizedBox.expand(child: Image.asset('assets/Images/splash_image.png')),
=======
      body: SizedBox.expand(
        child: Image.asset('assets/Images/splash_image.png'),
      ),
>>>>>>> main
    );
  }
}
