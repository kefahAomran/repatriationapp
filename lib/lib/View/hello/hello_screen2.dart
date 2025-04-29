import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:repatriationapp/lib/View/authentication/registration_screen.dart';
import 'package:repatriationapp/lib/View/home/home_screen.dart';

import '../../Component/app_colors.dart';
import '../../Component/app_locale.dart';
import '../authentication/login_screen.dart';

class HelloScreen2 extends StatelessWidget {
  const HelloScreen2({super.key});

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
                'Welcome to Repatriation Mobile App'.tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              Text(
                'I am a'.tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              // Role Selection Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRoleButton(
                    context: context,
                    imagePath: 'assets/icons/donor.png',
                    label: 'Donor'.tr,
                    onTap: () => Get.to(() => const RegistrationScreen()),
                  ),
                  _buildRoleButton(
                    context: context,
                    imagePath: 'assets/icons/donee.png', // مسار صورة المستفيد
                    label: 'Donee'.tr,
                    onTap: () => Get.to(() => const LoginScreen()),
                  ),
                  _buildRoleButton(
                    context: context,
                    imagePath:
                        'assets/icons/volunteer.png', // مسار صورة المتطوع
                    label: 'Volunteer'.tr,
                    onTap: () => null, //Get.to(() => const LoginScreen()),
                  ),
                ],
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton({
    required BuildContext context,
    required String imagePath, // مسار الصورة
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.primary,
            child: Image.asset(
              imagePath, // عرض الصورة بدلاً من الأيقونة
              width: 50,
              height: 32,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
