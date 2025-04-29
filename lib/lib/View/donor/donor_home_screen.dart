import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repatriationapp/lib/View/donor/tabs/donation_type_selection_tab.dart';
import 'package:repatriationapp/lib/View/donor/tabs/previous_donations_tab.dart';
import '../../Controller/HomeController.dart';
import '../../View/home/Setting/SettingsTab.dart';
import '../../View/home/News/StayTuneTab.dart';
import '../../Controller/authentication_manager.dart';

class DonorHomeScreen extends StatefulWidget {
  const DonorHomeScreen({super.key});

  @override
  State<DonorHomeScreen> createState() => _DonorHomeScreenState();
}

class _DonorHomeScreenState extends State<DonorHomeScreen> {
  int _currentIndex = 0;
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());

  @override
  void initState() {
    super.initState();

    _authManager.isLogged.value = true;
  }

  final HomeController controller = Get.put(HomeController());

  final List<Widget> _tabs = [
    DonationTypeSelectionTab(),
    const PreviousDonationsTab(),
    // StayTuneTab(),
    // SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: 'Donate'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: 'Donate History'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: 'Stay Tune'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'Settings'.tr,
          ),
        ],
      ),
    );
  }
}
