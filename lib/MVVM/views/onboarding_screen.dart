// lib/views/onboarding_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_screens/MVVM/models/onboarding_model.dart';
import 'package:intro_screens/MVVM/viewmodels/onboarding_viewmodel.dart';
import 'package:intro_screens/widgets/onboardingpage.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  final List<OnboardingModel> onboardingData;

  OnboardingScreen({required this.onboardingData});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnboardingViewModel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff010723),
        body: Stack(
          children: [
            PageView.builder(
              controller: viewModel.pageController,
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                    data: onboardingData[index], pageIndex: index);
              },
              onPageChanged: (index) {
                viewModel.currentIndex = index;
              },
            ),
            Positioned(
              top: 20.0, // Adjust the top position
              right: 20.0, // Adjust the right position
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0B2133),
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  if (viewModel.currentIndex < onboardingData.length - 1) {
                    // If not on the last page, jump to the last page
                    viewModel.pageController
                        .jumpToPage(onboardingData.length - 1);
                  } else {
                    // Handle Reset button action here
                    // You can implement a reset action as needed
                    // For example, reset the state and navigate to the first screen
                    viewModel.reset();
                  }
                },
                child: Text(
                  'Skip',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 161, 186, 203),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40.0, // Adjust the bottom position
              left: 0,
              right: 0,
              child: FractionallySizedBox(
                widthFactor: 0.118, // Adjust the width factor as needed
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: viewModel.pageController,
                  count: onboardingData.length,
                  effect: WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Color(0xff0448D8),
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
