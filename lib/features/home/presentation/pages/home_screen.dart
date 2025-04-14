import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/home_provider.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '/features/family/presentation/providers/family_info_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  DateTime? _lastBackPressTime;

  final List<Widget> _screens = [
    const StayTuneTab(),
    const RequestTab(),
    const FamilyTab(),
    const SettingsTab(),
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
        const SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().loadUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleBackPress,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
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
                label: 'Stay Tune',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.description_outlined, size: 24.w),
                label: 'Request',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline, size: 24.w),
                label: 'Family',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined, size: 24.w),
                label: 'setting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StayTuneTab extends StatelessWidget {
  const StayTuneTab({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(5, (index) => index); // Generate 5 sample items

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Text(
            'Notifications',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.primary,
                      width: 1.5.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      // Green circular dot
                      Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 16.w),

                      // Text Section
                      Expanded(
                        child: Text(
                          'You have one',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      SizedBox(width: 16.w),

                      // Image
                      Container(
                        width: 60.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/onboarding_image_3.png'), // Your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RequestTab extends StatelessWidget {
  const RequestTab({super.key});
  PopupMenuItem<String> _buildPopupMenuItem({
    required String value,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: color, size: 20.w),
          SizedBox(width: 12.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _handleMenuSelection(String value, BuildContext context) {
    switch (value) {
      case 'edit':
        AppRoutes.navigateToEditRequest(context);
        break;
      case 'delete':
        _showDeleteConfirmation(context);
        break;
    }
  }

  void _handleEditAction(BuildContext context) {
    AppRoutes.navigateToEditFamilyInfo(context);
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Confirm Delete',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Are you sure you want to delete this item?',
          style: TextStyle(fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(fontSize: 14.sp)),
          ),
          TextButton(
            onPressed: () {
              _performDeleteAction();
              Navigator.pop(context);
            },
            child: Text(
              'Delete',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _performDeleteAction() {
    // Implement your delete logic here
    // Example:
    // context.read<FamilyProvider>().deleteMember(memberId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Requests',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Type:',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                    PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert, size: 24.w),
                      onSelected: (value) =>
                          _handleMenuSelection(value, context),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        _buildPopupMenuItem(
                          value: 'edit',
                          icon: Icons.edit,
                          label: 'Edit',
                          color: AppColors.primary,
                        ),
                        _buildPopupMenuItem(
                          value: 'delete',
                          icon: Icons.delete_outline,
                          label: 'Delete',
                          color: Colors.red,
                        ),
                      ],
                    ), // Add explicit type
                  ],
                ),
                SizedBox(height: 8.h),
                Text('Member:',
                    style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                SizedBox(height: 8.h),
                Text('Desc:',
                    style: TextStyle(fontSize: 16.sp, color: Colors.black)),
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              AppRoutes.navigateToAddRequest(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'Add Request',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FamilyTab extends StatelessWidget {
  const FamilyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        children: [
          Text(
            'Family Members',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.26,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        AppRoutes.navigateToEditFamilyInfo(context);
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit Info'),
                      style: OutlinedButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                          foregroundColor: Colors.green,
                          side: const BorderSide(color: Colors.green),
                          padding: const EdgeInsets.only(right: 10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      AppRoutes.navigateToAddDoc(context);
                    },
                    icon: const Icon(Icons.description),
                    label: const Text('Family Docs'),
                    style: OutlinedButton.styleFrom(
                      textStyle: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                      foregroundColor: Colors.black87,
                      side: const BorderSide(color: Colors.black87),
                      padding: const EdgeInsets.only(right: 10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      AppRoutes.navigateToAddFamilyMember(context);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Member'),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        color: AppColors.primary,
                      ),
                      textStyle: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.primary,
                      padding: const EdgeInsets.only(right: 10.0),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Icon(
                Icons.arrow_upward,
                size: 16.w,
              ),
              Expanded(
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(Icons.arrow_upward, size: 16.w),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'Last Name',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 24.w),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.check_circle, color: AppColors.primary),
                  title: Text('John ${index + 1}'),
                  subtitle: Text('doh ${index + 1}'),
                  trailing: const Icon(Icons.more_vert),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Name',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '0999999999',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          _buildSettingItem(
            icon: Icons.notifications_outlined,
            title: 'Notification settings',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.language,
            title: 'Language',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLanguageOption('🇺🇸', 'EN', true),
                SizedBox(width: 8.w),
                _buildLanguageOption('🇸🇾', 'AR', false),
              ],
            ),
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.help_outline,
            title: 'FAQ',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.info_outline,
            title: 'About Us',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return Container(
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
        onTap: onTap,
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
        children: [
          Text(flag),
          SizedBox(width: 4.w),
          Text(code),
        ],
      ),
    );
  }
}
