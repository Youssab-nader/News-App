import 'package:flutter/widgets.dart';

class OnboardingController with ChangeNotifier {
  int pageIndex = 0;

  void pageChanged(int currentPageIndex) {
    pageIndex = currentPageIndex;
    notifyListeners();
  }


}
