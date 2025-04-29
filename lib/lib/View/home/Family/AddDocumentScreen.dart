import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/HomeController.dart';
import '../../../Component/app_colors.dart';
import '../../../Component/general_response.dart';
import '../../../Model/configrationModel.dart';
import '../../../Model/familyMemberModel.dart';

class AddDocumentContent extends StatefulWidget {
  final bool isEdit;
  final num idReq;
  AddDocumentContent({required this.isEdit, required this.idReq});

  @override
  State<AddDocumentContent> createState() => _AddDocumentContentState();
}

class _AddDocumentContentState extends State<AddDocumentContent> {
  final HomeController controller = Get.find();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: Text(widget.isEdit ? 'Edit Document'.tr : 'Add Document'.tr),

        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: _formKey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 5.h),
                  Text(
                    'Upload Image'.tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  InkWell(
                    onTap: () async {
                      await controller.pickImageFromCamera();
                      if (controller.base64String != null) {
                        setState(() {});
                      }
                    },
                    child:
                        controller.base64String == null
                            ? AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 200.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 2.w,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    size: 48.w,
                                    color: AppColors.primary,
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    'JPG,JPEG less than'.tr,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '500 Kb'.tr,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            : _buildImageFromBase64(controller.base64String),
                  ),

                  SizedBox(height: 18.h),
                  DropdownSearch<Doctype>(
                    popupProps: const PopupProps.menu(showSearchBox: true),
                    validator: (value) => value == null ? "" : null,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    items: doctype,
                    itemAsString: (u) => u.displayName.toString(),
                    selectedItem: controller.chooseDoctype,
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
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xff0402df),
                          ),
                        ),
                        label: Text("Document type".tr),
                      ),
                    ),
                    onChanged: (value) {
                      controller.chooseDoctype = value;
                      controller.update();
                    },
                  ),

                  SizedBox(height: 18.h),
                  DropdownSearch<FamilyMemberModel>(
                    popupProps: const PopupProps.menu(showSearchBox: true),
                    validator: (value) => value == null ? "" : null,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    items: controller.listFamilyMember,
                    itemAsString: (u) => "${u.firstName} ${u.lastName}",
                    selectedItem: controller.chooseFamilyMemberModel,
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
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xff0402df),
                          ),
                        ),
                        label: Text("Family Member".tr),
                      ),
                    ),
                    onChanged: (value) {
                      controller.chooseFamilyMemberModel = value;
                      controller.update();
                    },
                  ),
                  SizedBox(height: 18.h),

                  TextFormField(
                    controller: controller.documentDescController.value,

                    decoration: InputDecoration(
                      label: Text("Document Description".tr),

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
                  SizedBox(height: 50.h),
                  Obx(
                    () => ElevatedButton(
                      onPressed:
                          controller.finishAdd.value == true
                              ? () async {
                                if (_formKey1.currentState!.validate() &&
                                    controller.base64String != "") {
                                  String x =
                                      widget.isEdit
                                          ? await controller.editDoc(
                                            Id: widget.idReq,
                                          )
                                          : await controller.addDoc();
                                  if (x == "") {
                                    controller.documentDescController.value
                                        .clear();
                                    controller.base64String = null;
                                    controller.chooseDoctype = null;
                                    controller.chooseFamilyMemberModel = null;
                                    Get.close(1);
                                    await controller.getDoc();

                                    Get.snackbar(
                                      "Done".tr,
                                      "Added successfully".tr,
                                      duration: const Duration(seconds: 6),
                                      colorText: const Color(0xff0402df),
                                      backgroundColor: Colors.white,
                                    );
                                  } else {
                                    Get.snackbar(
                                      "Alert".tr,
                                      x,
                                      duration: const Duration(seconds: 6),
                                      colorText: const Color(0xff0402df),
                                      backgroundColor: Colors.white,
                                    );
                                  }
                                }
                              }
                              : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child:
                          controller.finishAdd.value == true
                              ? Text("Save".tr)
                              : const CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageFromBase64(String? base64String) {
    try {
      // If the string is not null or empty, decode and display it
      if (base64String != null && base64String.isNotEmpty) {
        return Image.memory(
          base64Decode(base64String),
          width: double.infinity,
          height: 150,
          fit: BoxFit.fill,
        );
      } else {
        // Return a placeholder if the Base64 string is empty
        return const Icon(Icons.image, size: 50);
      }
    } catch (e) {
      // Handle decoding error and return a fallback widget
      return const Icon(Icons.broken_image, size: 50);
    }
  }
}
