import 'package:expenz/constants/colors.dart';
import 'package:expenz/models/onboarding_data.dart';
import 'package:expenz/screens/onboarding/front_page.dart';
import 'package:expenz/screens/onboarding/shared_onboarding.dart';
import 'package:expenz/screens/user_add_screen.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  // PageController controller = PageController(initialPage: 0);
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      isLastPage = index == 3;
                      print(isLastPage);
                    });
                  },
                  children: [
                    FrontPage(),
                    SharedOnboarding(
                      title: OnboardingData.onBoardingDataLst[0].title,
                      description:
                          OnboardingData.onBoardingDataLst[0].description,
                      imagePath: OnboardingData.onBoardingDataLst[0].imagePath,
                    ),
                    SharedOnboarding(
                      title: OnboardingData.onBoardingDataLst[1].title,
                      description:
                          OnboardingData.onBoardingDataLst[1].description,
                      imagePath: OnboardingData.onBoardingDataLst[1].imagePath,
                    ),
                    SharedOnboarding(
                      title: OnboardingData.onBoardingDataLst[2].title,
                      description:
                          OnboardingData.onBoardingDataLst[2].description,
                      imagePath: OnboardingData.onBoardingDataLst[2].imagePath,
                    ),
                  ],
                ),

                Container(
                  alignment: Alignment(0, 0.65),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: const WormEffect(
                      activeDotColor: kMainColor,
                      dotHeight: 14,
                      dotWidth: 14,
                      spacing: 12,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child:
                      !isLastPage
                          ? GestureDetector(
                            onTap: () {
                              controller.animateToPage(
                                controller.page!.toInt() + 1,
                                duration: Duration(milliseconds: 400),

                                curve: Curves.easeInOut,
                              );
                            },
                            child: CustomButton(
                              buttonColor: kMainColor,
                              buttonText: isLastPage ? "Get Started" : "Next",
                            ),
                          )
                          : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserAddScreen(),
                                ),
                              );
                            },
                            child: CustomButton(
                              buttonColor: kMainColor,
                              buttonText: isLastPage ? "Get Started" : "Next",
                            ),
                          ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
