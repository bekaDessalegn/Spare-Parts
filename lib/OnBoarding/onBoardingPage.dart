import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spare_parts/OnBoarding/homepage.dart';
import 'package:spare_parts/TabBar/first_page.dart';
import 'package:spare_parts/TabBar/second_page.dart';
import 'package:spare_parts/TabBar/third_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [FirstPage(), SecondPage(), ThirdPage()],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool("showHome", true);

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingHompePage()));
              },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            primary: Colors.white,
            backgroundColor: Colors.teal.shade700,
            minimumSize: Size.fromHeight(80)
          ),
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 24),
              ))
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text("Skip")),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Colors.teal.shade700),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: Text("Next"))
                ],
              ),
            ),
    );
  }
}
