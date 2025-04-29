import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Controller/HomeController.dart';
import 'package:get/get.dart';

import '../../Component/app_colors.dart';
import 'Family/FamilyTab.dart';
import 'Request/RequestTab.dart';
import 'Setting/SettingsTab.dart';
import 'News/StayTuneTab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  DateTime? _lastBackPressTime;
  final HomeController controller = Get.put(HomeController());
  final List<Widget> _screens = [
    StayTuneTab(),
    RequestTab(),
    FamilyTab(),
    SettingsTab(),
  ];
  Future<bool> _handleBackPress() async {
    // If not on first tab, switch to first tab
    if (_currentIndex != 0) {
      setState(() => _currentIndex = 0);
      return false;
    }

    // Handle double-tap exit on first tab
    final now = DateTime.now();
    if (_lastBackPressTime == null ||
        now.difference(_lastBackPressTime!) > const Duration(seconds: 2)) {
      _lastBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Press back again to exit'.tr),
          duration: const Duration(seconds: 2),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleBackPress,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: IndexedStack(index: _currentIndex, children: _screens),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 12.sp,
              unselectedFontSize: 12.sp,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.tune, size: 24.w),
                  label: 'Stay Tune'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.description_outlined, size: 24.w),
                  label: 'Request'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people_outline, size: 24.w),
                  label: 'Family'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined, size: 24.w),
                  label: 'Settings'.tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
