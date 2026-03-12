class OnboardingWidgetsModel {
  final String photoPath;
  final String headTitle;
  final String subTitle;

  OnboardingWidgetsModel({
    required this.photoPath,
    required this.headTitle,
    required this.subTitle,
  });

  static final List<OnboardingWidgetsModel> onboardingWidgets = [
    OnboardingWidgetsModel(
      photoPath: 'assets/Images/onboarding1.png',
      headTitle: 'Trending News ',
      subTitle:
          'Stay in the loop with the biggest breaking stories in a stunning visual slider. Just swipe to explore what’s trending right now!',
    ),
    OnboardingWidgetsModel(
      photoPath: 'assets/Images/onboarding2.png',
      headTitle: 'Pick What You Love',
      subTitle:
          'No more endless scrolling! Tap into your favorite topics like Tech, Politics, or Sports and get personalized news in seconds',
    ),
    OnboardingWidgetsModel(
      photoPath: 'assets/Images/onboarding3.png',
      headTitle: 'Save It. Read It Later. Stay Smart.',
      subTitle:
          'Found something interesting? Tap the bookmark and come back to it anytime. Never lose a great read again!',
    ),
  ];
}
