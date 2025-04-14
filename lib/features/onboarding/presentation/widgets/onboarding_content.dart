import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int index;
  final int totalPages;

  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.index,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLastPage = index == totalPages - 1;
    final isFirstPage = index == 0;

    // Calculate responsive font size based on screen width
    final double responsiveFontSize = screenWidth * 0.04; // 4% of screen width

    return Column(
      children: [
        // Image section - 60% of screen height
        Container(
          height: screenHeight * 0.60,
          width: double.infinity,
          color: AppColors.primary,
          child: isLastPage
              ? Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                )
              : Center(
                  child: Image.asset(
                    image,
                    height:
                        isFirstPage ? screenHeight * 0.6 : screenHeight * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
        ),
        // Text section - Flexible height
        Expanded(
          child: Container(
            width: double.infinity,
            color: AppColors.white,
            padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: responsiveFontSize *
                              1.4, // Larger than description
                          height: 1.2,
                        ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    description,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: responsiveFontSize,
                      height: 1.5,
                      letterSpacing: 0.2,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
