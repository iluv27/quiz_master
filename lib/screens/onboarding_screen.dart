import 'package:flutter/material.dart';
import 'package:quiz_master/theme/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _backgroundImages = [
    'images/onboarding/onboardingimage1.png',
    'images/onboarding/onboardingimage2.png',
    'images/onboarding/onboardingimage3.png'
  ];

  @override
  Widget build(BuildContext context) {
    const List<OnboardingTexts> backgroundTexts = [
      OnboardingTexts(
        onboardingTitle: ' CodeQuiz Welcomes You! ',
        onboardingSubtitle:
            'A Hub for Coders of All Levels. Get Ready to Embark on a Learning Adventure.',
      ),
      OnboardingTexts(
        onboardingTitle: 'Master Coding Concepts',
        onboardingSubtitle:
            'Sharpen Your Coding Skills with Our Varied Quizzes. Tailored for Beginners and Pros Alike.',
      ),
      OnboardingTexts(
        onboardingTitle: 'Community Connect',
        onboardingSubtitle:
            'Solve Interview Questions, and Be Part of the CodeQuiz Experience. Your Coding Journey Starts Now.',
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _backgroundImages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ParallaxBackground(imagePath: _backgroundImages[index]),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: backgroundTexts[index],
                  )
                ],
              );
            },
          ),
          Positioned(
              top: 40,
              right: 20,
              child: InkWell(
                onTap: () {
                  _onFinish();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Skip',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const Icon(
                      Icons.chevron_right,
                      size: 23,
                      color: Colors.black45,
                    ),
                    const Icon(
                      Icons.chevron_right,
                      size: 25,
                      color: Colors.black45,
                    )
                  ],
                ),
              )),
          Positioned(
            bottom: 260,
            left: 0,
            right: 0,
            child: PageControllerIndicator(
              controller: _pageController,
              itemCount: _backgroundImages.length,
              color: AppColors.primary.withOpacity(0.2),
              selectedColor: AppColors.primary,
            ),
          ),
          Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    _nextPage();
                  },
                  style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                      AppColors.primary,
                    ),
                    minimumSize: MaterialStatePropertyAll(
                      Size(MediaQuery.sizeOf(context).width * 1, 45),
                    ),
                  ),
                  child: Text(
                    _currentPage < _backgroundImages.length - 1
                        ? 'Next'
                        : 'Get Started',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  void _nextPage() {
    if (_currentPage < _backgroundImages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // If it's the last page, do something else
      _onLastPage();
    }
  }

  void _onLastPage() {
    // Perform a different action on the last page
    print('Button on last page pressed');
    // Add your specific action here
  }

  void _onFinish() {
    // Jump to the last page
    _pageController.animateToPage(
      _backgroundImages.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

class OnboardingTexts extends StatelessWidget {
  const OnboardingTexts({
    super.key,
    required this.onboardingTitle,
    required this.onboardingSubtitle,
  });

  final String onboardingTitle;
  final String onboardingSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(onboardingTitle, style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(
          height: 8,
        ),
        Text(
          onboardingSubtitle,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                height: 1.5,
              ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class ParallaxBackground extends StatelessWidget {
  final String imagePath;

  const ParallaxBackground({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Image(
        height: MediaQuery.of(context).size.height * 0.69,
        image: AssetImage(imagePath),
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

class PageControllerIndicator extends StatelessWidget {
  final PageController controller;
  final int itemCount;
  final Color color;
  final Color selectedColor;

  const PageControllerIndicator({
    super.key,
    required this.controller,
    required this.itemCount,
    this.color = Colors.grey,
    this.selectedColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: index == controller.page?.round() ? 25.0 : 10.0,
            height: 10.0,
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            decoration: BoxDecoration(
              color: index == controller.page?.round() ? selectedColor : color,
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
        },
      ),
    );
  }
}
