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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                        elevation: 0,
                        backgroundColor: Color(0xff778595),
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        // Navigate to the previous page with animation
                        if (viewModel.currentIndex > 0) {
                          viewModel.pageController.animateToPage(
                            viewModel.currentIndex - 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SmoothPageIndicator(
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                        elevation: 0,
                        backgroundColor: Color(0xffFF5858),
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        // Navigate to the next page with animation
                        if (viewModel.currentIndex <
                            onboardingData.length - 1) {
                          viewModel.pageController.animateToPage(
                            viewModel.currentIndex + 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
