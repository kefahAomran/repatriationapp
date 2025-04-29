import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final double? width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width = double.infinity, // Default to full width
    this.height = 52.0, // Default height
    this.borderRadius = 26.0, // Fully rounded corners
    this.backgroundColor = AppColors.actionBlue,
    this.textColor = AppColors.white,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w, // Apply screenutil scaling if width is provided
      height: height.h, // Apply screenutil scaling to height
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                borderRadius.r), // Apply screenutil scaling
          ),
          elevation: 0, // Flat design as per image
          padding: EdgeInsets.zero, // Control padding via SizedBox
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isLoading
              ? Center(
                  child: SizedBox(
                    width: 24.w, // Scaled size
                    height: 24.h, // Scaled size
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2.5,
                    ),
                  ),
                )
              : Text(
                  text,
                  key: ValueKey<String>(text), // Key for animation
                  style: TextStyle(
                    fontSize: fontSize.sp, // Scaled font size
                    fontWeight: fontWeight,
                    color: textColor,
                    fontFamily: 'Manrope', // Ensure this font is available
                  ),
                ),
        ),
      ),
    );
  }
}
