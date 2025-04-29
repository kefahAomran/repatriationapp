import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/HomeController.dart';
import '../../authentication/login_screen.dart';
import '../../home/home_screen.dart';

import '../../../Component/app_colors.dart';
import '../../../Component/general_response.dart';
import '../../../Controller/HomeBind.dart';
import '../../../Controller/authentication_manager.dart';
import '../../../Controller/changelocal.dart';
import 'Faq.dart';

class SettingsTab extends StatelessWidget {
  SettingsTab({super.key});
  final LocaleController controller = Get.find();
  final HomeController controllerHome = Get.find();
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icpc_logo.png',
                  width: 110.w,
                  height: 110.w,
                ),
                SizedBox(width: 50.w),
                Obx(
                  () =>
                      controllerHome.getconfigration.value
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${userInfo?.firstName ?? ""}"
                                " ${userInfo?.lastName ?? ""}",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                userInfo?.phoneNumber ?? "",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          )
                          : Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),
          _buildSettingItem(
            icon: Icons.notifications_outlined,
            title: 'Notification settings'.tr,
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.language,
            title: 'Language'.tr,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap:
                      languagee == "ar"
                          ? () {
                            controller.changeLang("en");
                            controllerHome.initialize();
                          }
                          : null,
                  child: _buildLanguageOption('🇺🇸', 'EN', false),
                ),
                SizedBox(width: 8.w),
                InkWell(
                  onTap:
                      languagee == "en"
                          ? () {
                            controller.changeLang("ar");
                            controllerHome.initialize();
                          }
                          : null,
                  child: _buildLanguageOption('🇸🇾', 'AR', false),
                ),
              ],
            ),
            onTap: null,
          ),
          _buildSettingItem(
            icon: Icons.help_outline,
            title: 'FAQ'.tr,
            onTap: () async {
              String x = await controllerHome.faq();
              if (x == "") {
                Get.to(() => FAQ());
              } else {
                Get.snackbar("Alert", x);
              }
            },
          ),
          _buildSettingItem(
            icon: Icons.info_outline,
            title: 'About Us'.tr,
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.logout,
            title: 'Logout'.tr,
            onTap: () {
              try {
                print("test");
                _authManager.logOut();
                Get.offAll(() => LoginScreen(), binding: HomeBind());
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String flag, String code, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey.shade200 : Colors.transparent,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Text(flag), SizedBox(width: 4.w), Text(code)],
      ),
    );
  }
}
