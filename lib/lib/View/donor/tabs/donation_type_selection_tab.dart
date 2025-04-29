import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repatriationapp/lib/Controller/HomeController.dart';
import 'package:repatriationapp/lib/View/donor/monetary_donation_screen.dart';

class DonationTypeSelectionTab extends StatelessWidget {
  DonationTypeSelectionTab({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Donation Type'.tr)),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: [
          _buildDonationCard(
            icon: Icons.monetization_on,
            title: 'Monetary'.tr,
            description: 'Financial donations to support our cause'.tr,
            onTap: () => Get.to(() => const MonetaryDonationScreen()),
          ),
          _buildDonationCard(
            icon: Icons.medical_services,
            title: 'Medical Supplies'.tr,
            description: 'Donate medical equipment'.tr,
            onTap: () {},
          ),
          _buildDonationCard(
            icon: Icons.school,
            title: 'Educational'.tr,
            description: 'Support education initiatives'.tr,
            onTap: () {},
          ),
          _buildDonationCard(
            icon: Icons.food_bank,
            title: 'Food'.tr,
            description: 'Donate food items and supplies'.tr,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDonationCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
