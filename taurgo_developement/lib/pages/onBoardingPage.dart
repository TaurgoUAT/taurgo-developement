import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/landingPage.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          OnboardingScreen(
            logo: 'assets/logo/logo.png',
            // Replace with your logo asset
            heading: 'You Capture',
            image: 'assets/images/onboardingnew.png',
            // Replace with your image asset
            subtext: 'Capture all your images',
            isLastScreen: false,
            onSkip: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingPage()),
              );
            },
            onGetStarted:
                () {}, // Provide an empty function for non-last screens
          ),
          OnboardingScreen(
            logo: 'assets/logo/logo.png',
            // Replace with your logo asset
            heading: 'We Create',
            image: 'assets/images/onboarding2.png',
            // Replace with your image asset
            subtext: 'Create your virtual tour',
            isLastScreen: false,
            onSkip: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingPage()),
              );
            },
            onGetStarted:
                () {}, // Provide an empty function for non-last screens
          ),
          OnboardingScreen(
            logo: 'assets/logo/logo.png',
            // Replace with your logo asset
            heading: 'You Share',
            image: 'assets/images/onboarding3.png',
            // Replace with your image asset
            subtext: 'Share with everyone',
            isLastScreen: true,
            onSkip: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingPage()),
              );
            },
            onGetStarted: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final String logo;
  final String heading;
  final String image;
  final String subtext;
  final bool isLastScreen;
  final VoidCallback onSkip;
  final VoidCallback onGetStarted;

  OnboardingScreen({
    required this.logo,
    required this.heading,
    required this.image,
    required this.subtext,
    required this.isLastScreen,
    required this.onSkip,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(logo, height: 120), // Logo at the top
          SizedBox(height: 20),
          Text(
            heading,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Image.asset(image, height: 328), // Image
          SizedBox(height: 20),
          Text(
            subtext,
            style: TextStyle(fontSize: 16, color: kPrimaryColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          if (!isLastScreen) // Skip button for the first two screens
            TextButton(
              onPressed: onSkip,
              child: Text(
                'Skip',
                style: TextStyle(color: kSecondaryBorderColor),
              ),
            )
          else
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LandingPage()),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                child: Text(
                  'Let' 's Get Started',
                  style: TextStyle(fontSize: 12, color: bWhite),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                foregroundColor: bWhite, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(50), // Button corner radius
                ),
              ),
            ),
        ],
      ),
    );
  }
}
