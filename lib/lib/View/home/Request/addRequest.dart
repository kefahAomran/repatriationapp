import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/HomeController.dart';

import '../../../Component/app_colors.dart';
import '../../../Component/general_response.dart';
import '../../../Model/configrationModel.dart';

class addRequest extends StatelessWidget {
  final HomeController controller = Get.find();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final bool isEdit;
  final num idReq;
  addRequest({required this.isEdit, required this.idReq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            isEdit == true ? Text("Edit Request".tr) : Text("Add Request".tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey1,

            child: Column(
              children: [
                TextFormField(
                  controller: controller.descController.value,

                  decoration: InputDecoration(
                    label: Text("Note".tr),

                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' ';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 12.h),

                DropdownSearch<Need>(
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  validator: (value) => value == null ? "" : null,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  items: need,
                  itemAsString: (u) => u.displayName.toString(),
                  selectedItem: controller.chooseneed,
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
                      label: Text("Need".tr),
                    ),
                  ),
                  onChanged: (value) {
                    controller.chooseneed = value;
                    controller.update();
                  },
                ),

                SizedBox(height: 50.h),
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
                                      isEdit
                                          ? await controller.editRequest(
                                            Id: idReq,
                                          )
                                          : await controller.addRequest();
                                  if (x == "") {
                                    controller.descController.value.clear();
                                    controller.chooseneed = null;
                                    Get.back();
                                    await controller.getRequest();

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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
