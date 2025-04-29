import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repatriationapp/lib/Controller/changelocal.dart';
import '../../Controller/HomeController.dart';
import '../../Controller/authentication_manager.dart';

class MonetaryDonationScreen extends StatefulWidget {
  const MonetaryDonationScreen({super.key});

  @override
  State<MonetaryDonationScreen> createState() => _MonetaryDonationScreenState();
}

class _MonetaryDonationScreenState extends State<MonetaryDonationScreen> {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  final LocaleController _localeController = Get.put(LocaleController());

  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _currencyController = TextEditingController(text: 'SAR');
  final _donorNameController = TextEditingController();
  final _notesController = TextEditingController();
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _authManager.isLogged.value = true;
    _localeController.isuseralreadylogin = true;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _currencyController.dispose();
    _donorNameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monetary Donation'.tr)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Amount'.tr,
                  prefixIcon: const Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter amount'.tr;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _currencyController,
                decoration: InputDecoration(
                  labelText: 'Currency'.tr,
                  prefixIcon: const Icon(Icons.currency_exchange),
                ),
                readOnly: true,
                onTap: () {
                  // Show currency selection dialog
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _donorNameController,
                decoration: InputDecoration(
                  labelText: 'Donor Name'.tr,
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter donor name'.tr;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                decoration: InputDecoration(
                  labelText: 'Notes'.tr,
                  prefixIcon: const Icon(Icons.note),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitDonation,
                child: Text('Confirm Donation'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitDonation() {
    if (_formKey.currentState?.validate() ?? false) {
      // Show success dialog
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text('Donation Successful'.tr),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Thank you for your donation!'.tr),
                  const SizedBox(height: 16),
                  Text(
                    'Reference Number: ${DateTime.now().millisecondsSinceEpoch}',
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Amount: ${_amountController.text} ${_currencyController.text}',
                  ),
                  const SizedBox(height: 16),
                  Text('Date: ${DateTime.now().toString()}'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    Get.back(); // Return to donation type selection
                  },
                  child: Text('Return to Donation'.tr),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    // Navigate to donation tracking
                  },
                  child: Text('Track Donation'.tr),
                ),
              ],
            ),
      );
    }
  }
}
