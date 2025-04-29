import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repatriationapp/lib/View/donor/donor_home_screen.dart';
import 'package:repatriationapp/lib/View/authentication/login_screen.dart';

import '../../Component/app_colors.dart';
import '../../Controller/authentication_manager.dart';

class DonorDocumentationScreen extends StatefulWidget {
  const DonorDocumentationScreen({super.key});

  @override
  State<DonorDocumentationScreen> createState() =>
      _DonorDocumentationScreenState();
}

class _DonorDocumentationScreenState extends State<DonorDocumentationScreen> {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  final List<String> _documentTypes = [
    'ID Card'.tr,
    'Driving License'.tr,
    'Passport'.tr,
  ];
  final List<String> _uploadedDocuments = [];

  @override
  void initState() {
    super.initState();
    _authManager.isLogged.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Documentation'.tr), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Required Documents'.tr,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children:
                    _documentTypes.map((docType) {
                      return FilterChip(
                        label: Text(docType),
                        selected: _uploadedDocuments.contains(docType),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              _uploadedDocuments.add(docType);
                            } else {
                              _uploadedDocuments.remove(docType);
                            }
                          });
                        },
                        backgroundColor: Colors.white,
                        selectedColor: AppColors.primary.withOpacity(0.2),
                        checkmarkColor: AppColors.primary,
                        labelStyle: TextStyle(
                          color:
                              _uploadedDocuments.contains(docType)
                                  ? AppColors.primary
                                  : Colors.black,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          side: BorderSide(
                            color:
                                _uploadedDocuments.contains(docType)
                                    ? AppColors.primary
                                    : Colors.grey[300]!,
                          ),
                        ),
                      );
                    }).toList(),
              ),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement document upload functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      side: const BorderSide(color: AppColors.primary),
                    ),
                  ),
                  child: Text(
                    'Upload Document'.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              if (_uploadedDocuments.isNotEmpty) ...[
                SizedBox(height: 32.h),
                Text(
                  'Uploaded Documents'.tr,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _uploadedDocuments.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.only(bottom: 8.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: ListTile(
                        title: Text(_uploadedDocuments[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.visibility),
                              color: AppColors.primary,
                              onPressed: () {
                                // Implement document view functionality
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () {
                                setState(() {
                                  _uploadedDocuments.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (_uploadedDocuments.isNotEmpty) {
                      // تجاوز التحقق من حالة تسجيل الدخول والانتقال مباشرة
                      Get.to(() => const DonorHomeScreen());
                    } else {
                      Get.snackbar(
                        'Error'.tr,
                        'Please upload at least one document'.tr,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    'Complete Registration'.tr,
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
    );
  }
}
