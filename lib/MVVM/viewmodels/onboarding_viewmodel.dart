// lib/viewmodels/onboarding_viewmodel.dart

import 'package:flutter/material.dart';
import 'package:intro_screens/main.dart';

class OnboardingViewModel extends ChangeNotifier {
  int currentIndex = 0;

  PageController pageController = PageController();

  void next() {
    if (currentIndex < onboardingData.length - 1) {
      currentIndex++;
      pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
      notifyListeners();
    }
  }

  void skip() {
    currentIndex = onboardingData.length; // Go to the reset screen
    notifyListeners();
  }

  void reset() {
    currentIndex = 0;
    pageController.jumpToPage(0); // Reset to the first screen
    notifyListeners();
  }
}
