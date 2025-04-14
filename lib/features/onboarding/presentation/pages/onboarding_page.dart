import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_content.dart';
import '../../../../core/routes/app_routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _contents = [
    const OnboardingContent(
      image: 'assets/onboarding_image_1.png',
      title: 'Welcome!',
      description:
          'The International Civilian Protection Agency (ICPC) is an international organization with legal personality, established in accordance with the principles of independent diplomacy. It is a non-governmental, non-profit organization.',
      index: 0,
      totalPages: 3,
    ),
    const OnboardingContent(
      image: 'assets/onboarding_image_2.png',
      title: 'Civilian Protection',
      description:
          'The Agency operates as an accredited partner of the United Nations in implementing humanitarian and development projects, adhering to applicable international standards.',
      index: 1,
      totalPages: 3,
    ),
    const OnboardingContent(
      image: 'assets/onboarding_image_3.png',
      title: 'Our Mission',
      description:
          'The Agency operates as an accredited partner of the United Nations in implementing humanitarian and development projects, adhering to applicable international standards.',
      index: 2,
      totalPages: 3,
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Ensure status bar style is set when page initializes
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _contents.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) => _contents[index],
            ),
            // Navigation controls
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildNavigationControls(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationControls() {
    final isLastPage = _currentPage == _contents.length - 1;

    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: const Offset(0, -1),
            blurRadius: 3,
          ),
        ],
      ),
      child: isLastPage
          ? Center(
              child: SizedBox(
                width: 220,
                child: ElevatedButton(
                  onPressed: () => AppRoutes.navigateToHello(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.actionBlue,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30), // 30% of height (48*0.3 ≈ 14)
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      _contents.length - 1,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                    backgroundColor: AppColors.skipButtonBg,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Skip'),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    _contents.length,
                    (index) => Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == _currentPage
                            ? AppColors.indicatorActive
                            : AppColors.indicatorInactive,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.actionBlue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
