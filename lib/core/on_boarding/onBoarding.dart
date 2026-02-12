import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:route_flutter_islami/core/screens/sibha.dart';
import 'package:route_flutter_islami/core/widgets/onboarding_page.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _onBoardingPages = [
    const OnBoardingPage(
      title: 'Welcome to Islami App',
      description: '',
      image: 'assets/images/onBoarding1.png',
    ),
    const OnBoardingPage(
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
      image: 'assets/images/onBoarding2.png',
    ),
    const OnBoardingPage(
      title: 'Reading The Quran',
      description: 'Read, and your Lord is the Most Generous',
      image: 'assets/images/onBoarding3.png',
    ),
    const OnBoardingPage(
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
      image: 'assets/images/onBoarding4.png',
    ),
    const OnBoardingPage(
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
      image: 'assets/images/onBoarding5.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onBoardingPages.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return _onBoardingPages[index];
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: _currentPage > 0,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: const Text('Back',
                        style: TextStyle(
                            color: Color(0xFFE2BE7F),
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onBoardingPages.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_currentPage == _onBoardingPages.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Sibha()),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Text(
                      _currentPage == _onBoardingPages.length - 1
                          ? 'Finish'
                          : 'Next',
                      style: const TextStyle(
                          color: Color(0xFFE2BE7F),
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 7,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? const Color(0xFFE2BE7F) : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
