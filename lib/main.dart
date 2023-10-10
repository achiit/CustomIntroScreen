// lib/main.dart

import 'package:flutter/material.dart';
import 'package:intro_screens/MVVM/models/onboarding_model.dart';
import 'package:intro_screens/MVVM/viewmodels/onboarding_viewmodel.dart';
import 'package:intro_screens/MVVM/views/onboarding_screen.dart';
import 'package:provider/provider.dart';

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    title: 'Create Profile',
    description: 'Show what a sports enthusiast you are!',
    imagePath: 'assets/intro 1.svg', // Replace with your image paths
  ),
  OnboardingModel(
    title: 'Join Games',
    description: 'Discover football events and fixtures',
    imagePath: 'assets/intro 2.svg', // Replace with your image paths
  ),
  OnboardingModel(
    title: 'Sign Up',
    description: 'Get started to make a new play buddy!',
    imagePath: 'assets/intro 5.svg', // Replace with your image paths
  ),

  // Add more OnboardingModel instances for additional screens
];

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => OnboardingViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<OnboardingViewModel>(
        builder: (context, viewModel, child) {
          return OnboardingScreen(
              onboardingData: onboardingData); // Pass the onboarding data
        },
      ),
    );
  }
}
