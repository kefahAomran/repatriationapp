import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/HomeController.dart';

import '../../../Component/app_colors.dart';
import '../../../Component/general_response.dart';
import '../../../Model/configrationModel.dart';

class AddFamilyMemberScreen extends StatelessWidget {
  final HomeController controller = Get.find();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final bool isEdit;
  final num idReq;
  AddFamilyMemberScreen({required this.isEdit, required this.idReq});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            isEdit == true
                ? Text("Edit Family Member".tr)
                : Text("Add Family Member".tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey1,

            child: Column(
              children: [
                SizedBox(height: 5.h),
                DropdownSearch<Relative>(
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  validator: (value) => value == null ? "" : null,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  items: relative,
                  itemAsString: (u) => u.displayName.toString(),
                  selectedItem: controller.chooserelative,
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
                      label: Text("Relative".tr),
                    ),
                  ),
                  onChanged: (value) {
                    controller.chooserelative = value;
                    controller.update();
                  },
                ),

                SizedBox(height: 5.h),
                TextFormField(
                  controller: controller.firstNameController.value,

                  decoration: InputDecoration(
                    label: Text("First Name".tr),

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
                  controller: controller.lastNameController.value,

                  decoration: InputDecoration(
                    label: Text("Last Name".tr),

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
                  controller: controller.fatherNameController.value,

                  decoration: InputDecoration(
                    label: Text("Father Name".tr),

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
                  controller: controller.motherNameController.value,

                  decoration: InputDecoration(
                    label: Text("Mother Name".tr),

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
                  controller: controller.idController.value,

                  decoration: InputDecoration(
                    label: Text("Nation Number".tr),

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
                  items: controller.listType,
                  itemAsString: (u) => u.toString(),
                  selectedItem: controller.chooseGender,
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
                      label: Text("Gender".tr),
                    ),
                  ),
                  onChanged: (value) {
                    controller.chooseGender = value;
                    controller.update();
                  },
                ),

                SizedBox(height: 5.h),

                TextFormField(
                  // textAlign: TextAlign.center,
                  readOnly: true,
                  onTap: () {
                    controller.selectDate(context);
                  },
                  controller: controller.birthDateController.value,
                  validator: (value) => value!.isEmpty ? '' : null,
                  decoration: InputDecoration(
                    label: Text("birth date".tr),
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
                ),

                SizedBox(height: 5.h),
                DropdownSearch<Job>(
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  validator: (value) => value == null ? "" : null,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  items: job,
                  itemAsString: (u) => u.displayName.toString(),
                  selectedItem: controller.choosejob,
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
                      label: Text("Job".tr),
                    ),
                  ),
                  onChanged: (value) {
                    controller.choosejob = value;
                    controller.update();
                  },
                ),
                SizedBox(height: 5.h),
                DropdownSearch<Marriage>(
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  validator: (value) => value == null ? "" : null,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  items: marriage,
                  itemAsString: (u) => u.displayName.toString(),
                  selectedItem: controller.chooseMarriage,
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
                      label: Text("Marriage Status".tr),
                    ),
                  ),
                  onChanged: (value) {
                    controller.chooseMarriage = value;
                    controller.update();
                  },
                ),
                SizedBox(height: 5.h),
                DropdownSearch<Diplom>(
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  validator: (value) => value == null ? "" : null,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  items: diplom,
                  itemAsString: (u) => u.displayName.toString(),
                  selectedItem: controller.chooseDiplom,
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
                      label: Text("Education".tr),
                    ),
                  ),
                  onChanged: (value) {
                    controller.chooseDiplom = value;
                    controller.update();
                  },
                ),
                SizedBox(height: 5.h),
                DropdownSearch<Health>(
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  validator: (value) => value == null ? "" : null,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  items: health,
                  itemAsString: (u) => u.displayName.toString(),
                  selectedItem: controller.chooseHealth,
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
                      label: Text("Health Status".tr),
                    ),
                  ),
                  onChanged: (value) {
                    controller.chooseHealth = value;
                    controller.update();
                  },
                ),
                SizedBox(height: 5.h),
                DropdownSearch<Living>(
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  validator: (value) => value == null ? "" : null,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  items: living,
                  itemAsString: (u) => u.displayName.toString(),
                  selectedItem: controller.chooseLiving,
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
                      label: Text("Living Status".tr),
                    ),
                  ),
                  onChanged: (value) {
                    controller.chooseLiving = value;
                    controller.update();
                  },
                ),

                SizedBox(height: 20.h),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed:
                          controller.finishAdd.value == true
                              ? () async {
                                if (_formKey1.currentState!.validate()) {
                                  String x =
                                      isEdit == true
                                          ? await controller.editFamilyMember(
                                            Id: idReq,
                                          )
                                          : await controller.addFamilyMember();
                                  if (x == "") {
                                    Get.back();
                                    await controller.getFamilyMember();
                                    isEdit == true
                                        ? Get.snackbar(
                                          "Done".tr,
                                          "Edited successfully".tr,
                                        )
                                        : Get.snackbar(
                                          "Done".tr,
                                          "Added successfully".tr,
                                        );
                                  } else {
                                    Get.snackbar("Alert".tr, x);
                                  }
                                }
                              }
                              : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                      ),
                      child:
                          controller.finishAdd.value == true
                              ? Text("Save".tr)
                              : const CircularProgressIndicator(),
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
