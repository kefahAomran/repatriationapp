import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repatriationapp/lib/View/donor/donor_home_screen.dart';
import 'package:repatriationapp/lib/View/donor/donor_documentation_screen.dart';

import '../../Component/app_colors.dart';

class DonorProfileCompletion extends StatefulWidget {
  const DonorProfileCompletion({super.key});

  @override
  State<DonorProfileCompletion> createState() => _DonorProfileCompletionState();
}

class _DonorProfileCompletionState extends State<DonorProfileCompletion> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedGender;
  DateTime? _selectedDate;
  String? _selectedNationality;
  String? _selectedCountry;
  String? _selectedProfession;
  String? _selectedDonationReason;

  final List<String> _genders = [
    'Male'.tr,
    'Female'.tr,
    'Prefer not to say'.tr,
  ];
  final List<String> _countries = ['Saudi Arabia'.tr, 'UAE'.tr, 'Kuwait'.tr];
  final List<String> _professions = [
    'Doctor'.tr,
    'Engineer'.tr,
    'Housewife'.tr,
  ];
  final List<String> _donationReasons = [
    'Support Orphans'.tr,
    'Help Patients'.tr,
    'Support Education'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Information'.tr), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 5.h),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Full Name'.tr),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5.h),
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  validator: (value) => value == null ? "" : null,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  items: _genders,
                  selectedItem: _selectedGender,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.r),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.r),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      label: Text('Gender'.tr),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text('Birth Date'.tr),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          setState(() {
                            _selectedDate = date;
                          });
                        }
                      },
                    ),
                  ),
                  controller: TextEditingController(
                    text: _selectedDate?.toString().split(' ')[0] ?? '',
                  ),
                ),
                SizedBox(height: 5.h),
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  validator: (value) => value == null ? "" : null,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  items: _countries,
                  selectedItem: _selectedNationality,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.r),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.r),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      label: Text('Nationality'.tr),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedNationality = value;
                    });
                  },
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('ID Number'.tr),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5.h),
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  validator: (value) => value == null ? "" : null,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  items: _countries,
                  selectedItem: _selectedCountry,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.r),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.r),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      label: Text('Country'.tr),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedCountry = value;
                    });
                  },
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('City'.tr),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Postal Code'.tr),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Phone Number'.tr),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5.h),
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  validator: (value) => value == null ? "" : null,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  items: _professions,
                  selectedItem: _selectedProfession,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.r),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.r),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      label: Text('Profession'.tr),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedProfession = value;
                    });
                  },
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Workplace'.tr),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5.h),
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  validator: (value) => value == null ? "" : null,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  items: _donationReasons,
                  selectedItem: _selectedDonationReason,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.r),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.r),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      label: Text('Donation Reason'.tr),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedDonationReason = value;
                    });
                  },
                ),
                SizedBox(height: 32.h),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(() => const DonorDocumentationScreen());
                      } else {
                        // Get.snackbar(
                        //   'Error'.tr,
                        //   'Please fill all fields'.tr,
                        //   backgroundColor: Colors.red,
                        //   colorText: Colors.white,
                        // );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: Text(
                      'Next'.tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
