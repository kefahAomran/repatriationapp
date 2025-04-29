import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Component/app_colors.dart';
import '../../Component/app_locale.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isArabic = AppLocale.isArabic;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primary,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    isArabic ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 24,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.1),
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              // Logo with white circular background
              Center(
                child: Container(
                  width: size.width * 0.35,
                  height: size.width * 0.35,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/icpc_logo.png',
                    width: size.width * 0.25,
                    height: size.width * 0.25,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Welcome Text
              Center(
                child: Text(
                  isArabic ? 'مرحباً 👋' : 'Hello 👋',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  isArabic
                      ? 'مرحباً بك في تطبيق إعادة التوطين'
                      : 'Welcome to Repatriation Mobile App',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              // Authentication Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _buildAuthButton(
                      context: context,
                      label: isArabic ? 'تسجيل الدخول' : 'Sign Up'.tr,
                      onPressed: () {
                        //  AppRoutes.navigateToSignIn(context);

                        // Handle sign up
                      },
                      isPrimary: true,
                    ),
                    const SizedBox(height: 16),
                    _buildAuthButton(
                      context: context,
                      label: 'Create an account'.tr,
                      onPressed: () {
                        //  AppRoutes.navigateToRegister(context);

                        // Handle create account
                      },
                      isPrimary: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
    required bool isPrimary,
  }) {
    final isArabic = AppLocale.isArabic;

    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color:
            isPrimary
                ? Colors.white.withOpacity(0.2)
                : Colors.white.withOpacity(0.1),
        boxShadow: [
          if (isPrimary)
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(28),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.white,
                fontSize: 16,
                fontWeight: isPrimary ? FontWeight.w600 : FontWeight.w500,
                letterSpacing: isArabic ? 0 : 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
