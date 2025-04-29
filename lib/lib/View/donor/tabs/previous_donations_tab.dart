import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviousDonationsTab extends StatelessWidget {
  const PreviousDonationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Previous Donations'.tr)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5, // Example count
        itemBuilder: (context, index) {
          return _buildDonationCard(
            type: 'Monetary',
            amount: '1000 SAR',
            date: '2024-03-15',
            status: 'Completed',
            referenceNumber: 'REF${DateTime.now().millisecondsSinceEpoch}',
          );
        },
      ),
    );
  }

  Widget _buildDonationCard({
    required String type,
    required String amount,
    required String date,
    required String status,
    required String referenceNumber,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  type,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color:
                        status == 'Completed'
                            ? Colors.green
                            : status == 'Pending'
                            ? Colors.orange
                            : Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Amount: $amount'),
            Text('Date: $date'),
            Text('Reference: $referenceNumber'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Navigate to donation tracking
                  },
                  child: Text('Track Donation'.tr),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
