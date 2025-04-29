import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../View/hello/hello_screen2.dart';

import '../../Component/app_colors.dart';
import '../../Component/app_locale.dart';
import '../../Controller/changelocal.dart';

class HelloScreen1 extends StatelessWidget {
  HelloScreen1({super.key});
  LocaleController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1),
              // Logo with simple white circular background
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/icpc_logo.png',
                    width: size.width * 0.4375,
                    height: size.width * 0.4375,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Welcome Text
              Text(
                'Hello 👋'.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Welcome to Repatriation Mobile App'.tr,
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              // Add space to push language buttons to the beginning of last third
              SizedBox(height: size.height * 0.25),
              // Language Selection
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildLanguageButton(
                      context: context,
                      label: 'Hello'.tr,
                      onTap: () {
                        controller.changeLang("en");
                        //   AppLocale.setLocale(AppLocale.english);

                        Get.to(() => const HelloScreen2());
                      },
                    ),
                    _buildLanguageButton(
                      context: context,
                      label: 'مرحباً'.tr,
                      onTap: () {
                        controller.changeLang("ar");
                        //   AppLocale.setLocale(AppLocale.arabic);
                        Get.to(() => const HelloScreen2());
                      },
                    ),
                  ],
                ),
              ),
              // Remaining space at bottom
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageButton({
    required BuildContext context,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            // Custom underline that matches text width
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: _getTextWidth(context, label),
                  height: 2,
                  color: Colors.white,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  double _getTextWidth(BuildContext context, String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.width;
  }
}
