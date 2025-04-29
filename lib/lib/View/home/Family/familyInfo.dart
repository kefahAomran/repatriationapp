import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Component/app_colors.dart';
import '../../../Component/general_response.dart';
import '../../../Controller/familyController.dart';
import '../../../Model/configrationModel.dart';
import 'package:get/get.dart';

import 'LocationPreview.dart';
import 'Map.dart';

class EditFamilyInfoScreen extends StatefulWidget {
  const EditFamilyInfoScreen({super.key});

  @override
  State<EditFamilyInfoScreen> createState() => _EditFamilyInfoScreenState();
}

class _EditFamilyInfoScreenState extends State<EditFamilyInfoScreen> {
  final Familycontroller controller = Get.put(Familycontroller());
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    bool isFullWidth = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon, // أيقونة التقويم
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        label: Text(label),

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
          return 'Please enter'.tr + ' $label'.tr;
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Edit Family Info'.tr,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Form(
              key: _formKey1,
              child:
                  controller.getrequests.value
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current residence information".tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 10.h),
                          DropdownSearch<Country>(
                            popupProps: const PopupProps.menu(
                              showSearchBox: true,
                            ),
                            validator: (value) => value == null ? "" : null,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            items: country,
                            itemAsString: (u) => u.displayName.toString(),
                            selectedItem: controller.chooseCountry,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.r),
                                  borderSide: const BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                label: Text("Country".tr),
                              ),
                            ),
                            onChanged: (value) {
                              controller.chooseCountry = value;
                              controller.chooseRegion = null;
                              controller.chooseZone = null;
                              controller.zonelocal.clear();
                              controller.regionlocal.clear();
                              region.forEach((element) {
                                if (value?.code == element.countryCode)
                                  controller.regionlocal.add(element);
                              });
                              controller.update();
                            },
                          ),
                          SizedBox(height: 10.h),
                          GetBuilder<Familycontroller>(
                            builder: (context) {
                              return DropdownSearch<Region>(
                                popupProps: const PopupProps.menu(
                                  showSearchBox: true,
                                ),
                                validator: (value) => value == null ? "" : null,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                items: context.regionlocal,
                                itemAsString: (u) => u.displayName.toString(),
                                selectedItem: context.chooseRegion,
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.r),
                                      borderSide: BorderSide(
                                        color: Colors.grey[300]!,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.r),
                                      borderSide: const BorderSide(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    label: Text("Region".tr),
                                  ),
                                ),
                                onChanged: (value) {
                                  controller.chooseRegion = value;
                                  print(value?.code);
                                  controller.zonelocal.clear();
                                  controller.chooseZone = null;
                                  for (var action in zone) {
                                    if (action.regionCode == value?.code) {
                                      controller.zonelocal.add(action);
                                    }
                                  }

                                  print(controller.zonelocal);
                                  controller.update();
                                },
                              );
                            },
                          ),
                          SizedBox(height: 10.h),

                          GetBuilder<Familycontroller>(
                            builder: (context) {
                              return DropdownSearch<Zone>(
                                popupProps: const PopupProps.menu(
                                  showSearchBox: true,
                                ),
                                validator: (value) => value == null ? "" : null,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                items: context.zonelocal,
                                itemAsString: (u) => u.displayName.toString(),
                                selectedItem: context.chooseZone,
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.r),
                                      borderSide: BorderSide(
                                        color: Colors.grey[300]!,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.r),
                                      borderSide: const BorderSide(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    label: Text("Zone".tr),
                                  ),
                                ),
                                onChanged: (value) {
                                  controller.chooseZone = value;
                                  controller.update();
                                },
                              );
                            },
                          ),

                          SizedBox(height: 10.h),
                          DropdownSearch<Residencetype>(
                            popupProps: const PopupProps.menu(
                              showSearchBox: true,
                            ),
                            validator: (value) => value == null ? "" : null,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            items: residencetype,
                            itemAsString: (u) => u.displayName.toString(),
                            selectedItem: controller.chooseResidencetype,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.r),
                                  borderSide: const BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                label: Text("Residence".tr),
                              ),
                            ),
                            onChanged: (value) {
                              controller.chooseResidencetype = value;
                              controller.update();
                            },
                          ),

                          SizedBox(height: 10.h),
                          GetBuilder<Familycontroller>(
                            builder: (context) {
                              return ElevatedButton.icon(
                                onPressed: () {
                                  Get.to(
                                    () => SelectLocationPage(isOrigin: false),
                                  );
                                },
                                icon:
                                    (context.GpsX == null ||
                                            context.GpsY == null)
                                        ? Icon(
                                          Icons.my_location,
                                          color: AppColors.primary,
                                        )
                                        : Icon(Icons.done, color: Colors.green),
                                label: Text("Your Location".tr),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 110.w,
                                    vertical: 12.h,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 10.h),
                          GetBuilder<Familycontroller>(
                            builder: (builder) {
                              return (builder.GpsX == null ||
                                      builder.GpsY == null)
                                  ? Container()
                                  : LocationPreview(
                                    location: LatLng(
                                      builder.GpsX,
                                      builder.GpsY,
                                    ), // موقع دمشق كمثال
                                  );
                            },
                          ),
                          SizedBox(height: 10.h),
                          _buildInputField(
                            label: 'Address'.tr,
                            controller: controller.currentAddress.value,
                            isFullWidth: true,
                          ),
                          SizedBox(height: 10.h),
                          _buildInputField(
                            label: 'Mobile Number'.tr,
                            controller: controller.currentMobileNumber.value,
                            keyboardType: TextInputType.phone,
                            isFullWidth: true,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                onChanged: (val) async {
                                  setState(() {
                                    controller.checkBoxVal(val);
                                  });
                                },
                                value: controller.checkBoxVal.value,
                              ),
                              Text("Are you an immigrant?".tr),
                            ],
                          ),
                          Visibility(
                            visible: controller.checkBoxVal.value,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h),
                                Text(
                                  "Original residence information".tr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                DropdownSearch<Country>(
                                  popupProps: const PopupProps.menu(
                                    showSearchBox: true,
                                  ),
                                  validator:
                                      (value) => value == null ? "" : null,
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  items: country,
                                  itemAsString: (u) => u.displayName.toString(),
                                  selectedItem:
                                      controller.chooseCountryOriginal,
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.r),
                                                borderSide: BorderSide(
                                                  color: Colors.grey[300]!,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.r),
                                                borderSide: const BorderSide(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                              label: Text(
                                                "Original Country".tr,
                                              ),
                                            ),
                                      ),
                                  onChanged: (value) {
                                    controller.chooseCountryOriginal = value;
                                    controller.chooseOriRegion = null;
                                    controller.chooseOriZone = null;
                                    controller.zoneOriginalLocal.clear();
                                    controller.regionOriginallocal.clear();
                                    region.forEach((element) {
                                      if (value?.code == element.countryCode)
                                        controller.regionOriginallocal.add(
                                          element,
                                        );
                                    });
                                    controller.update();
                                  },
                                ),
                                SizedBox(height: 10.h),
                                GetBuilder<Familycontroller>(
                                  builder: (context) {
                                    return DropdownSearch<Region>(
                                      popupProps: const PopupProps.menu(
                                        showSearchBox: true,
                                      ),
                                      validator:
                                          (value) => value == null ? "" : null,
                                      autoValidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      items: context.regionOriginallocal,
                                      itemAsString:
                                          (u) => u.displayName.toString(),
                                      selectedItem: context.chooseOriRegion,
                                      dropdownDecoratorProps: DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.r),
                                                borderSide: BorderSide(
                                                  color: Colors.grey[300]!,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.r),
                                                borderSide: const BorderSide(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                              label: Text("Original Region".tr),
                                            ),
                                      ),
                                      onChanged: (value) {
                                        controller.chooseOriRegion = value;
                                        print(value?.code);
                                        controller.zoneOriginalLocal.clear();
                                        controller.chooseOriZone = null;
                                        for (var action in zone) {
                                          if (action.regionCode ==
                                              value?.code) {
                                            controller.zoneOriginalLocal.add(
                                              action,
                                            );
                                          }
                                        }

                                        print(controller.zonelocal);
                                        controller.update();
                                      },
                                    );
                                  },
                                ),
                                SizedBox(height: 10.h),
                                GetBuilder<Familycontroller>(
                                  builder: (context) {
                                    return DropdownSearch<Zone>(
                                      popupProps: const PopupProps.menu(
                                        showSearchBox: true,
                                      ),
                                      validator:
                                          (value) => value == null ? "" : null,
                                      autoValidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      items: context.zoneOriginalLocal,
                                      itemAsString:
                                          (u) => u.displayName.toString(),
                                      selectedItem: context.chooseOriZone,
                                      dropdownDecoratorProps: DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.r),
                                                borderSide: BorderSide(
                                                  color: Colors.grey[300]!,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.r),
                                                borderSide: const BorderSide(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                              label: Text("Original Zone".tr),
                                            ),
                                      ),
                                      onChanged: (value) {
                                        controller.chooseOriZone = value;
                                        controller.update();
                                      },
                                    );
                                  },
                                ),

                                SizedBox(height: 10.h),
                                DropdownSearch<Exittype>(
                                  popupProps: const PopupProps.menu(
                                    showSearchBox: true,
                                  ),
                                  validator:
                                      (value) => value == null ? "" : null,
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  items: exittype,
                                  itemAsString: (u) => u.displayName.toString(),
                                  selectedItem: controller.chooseExittype,
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.r),
                                                borderSide: BorderSide(
                                                  color: Colors.grey[300]!,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.r),
                                                borderSide: BorderSide(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                              label: Text("Exit Type".tr),
                                            ),
                                      ),
                                  onChanged: (value) {
                                    controller.chooseExittype = value;
                                    controller.update();
                                  },
                                ),
                                SizedBox(height: 10.h),
                                GestureDetector(
                                  onTap:
                                      () => _selectDate(
                                        context,
                                      ), // Show date picker on tap
                                  child: AbsorbPointer(
                                    child: _buildInputField(
                                      label: 'Exit Date'.tr,
                                      controller:
                                          controller
                                              .destinationZipController
                                              .value,
                                      keyboardType:
                                          TextInputType
                                              .none, // Disable keyboard
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.calendar_today,
                                          color: AppColors.primary,
                                        ),
                                        onPressed:
                                            () => _selectDate(
                                              context,
                                            ), // Show date picker
                                        padding:
                                            EdgeInsets
                                                .zero, // Remove padding for better alignment
                                        constraints:
                                            BoxConstraints(), // Remove constraints for better alignment
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                GetBuilder<Familycontroller>(
                                  builder: (context) {
                                    return ElevatedButton.icon(
                                      onPressed: () {
                                        Get.to(
                                          () => SelectLocationPage(
                                            isOrigin: true,
                                          ),
                                        );
                                      },
                                      icon:
                                          (context.originalGpsX == null ||
                                                  context.originalGpsY == null)
                                              ? Icon(
                                                Icons.my_location,
                                                color: AppColors.primary,
                                              )
                                              : Icon(
                                                Icons.done,
                                                color: Colors.green,
                                              ),
                                      label: Text("Your Original Location".tr),
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 88.w,
                                          vertical: 12.h,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                SizedBox(height: 10.h),
                                GetBuilder<Familycontroller>(
                                  builder: (builder) {
                                    return (builder.originalGpsX == null ||
                                            builder.originalGpsY == null)
                                        ? Container()
                                        : LocationPreview(
                                          location: LatLng(
                                            builder.originalGpsX,
                                            builder.originalGpsY,
                                          ), // موقع دمشق كمثال
                                        );
                                  },
                                ),
                                SizedBox(height: 10.h),
                                _buildInputField(
                                  label: 'Address'.tr,
                                  controller: controller.originalAddress.value,
                                  isFullWidth: true,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.h),
                          SizedBox(
                            width: double.infinity,
                            height: 56.h,
                            child: ElevatedButton(
                              onPressed:
                                  controller.finishAdd.value == true
                                      ? () async {
                                        if (_formKey1.currentState!
                                            .validate()) {
                                          if (((controller.originalGpsX ==
                                                          null ||
                                                      controller.originalGpsY ==
                                                          null) &&
                                                  controller
                                                          .checkBoxVal
                                                          .value ==
                                                      true) ||
                                              controller.GpsX == null ||
                                              controller.GpsY == null) {
                                            Get.snackbar(
                                              "Alert".tr,
                                              "Please select Your location".tr,
                                            );
                                          } else {
                                            String x =
                                                await controller.editfamily();
                                            if (x == "") {
                                              Get.back();
                                              Get.snackbar(
                                                "Done".tr,
                                                "Modified successfully".tr,
                                              );
                                            } else {
                                              Get.snackbar("Alert".tr, x);
                                            }
                                          }
                                        }
                                      }
                                      : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              child:
                                  controller.finishAdd.value == true
                                      ? Text(
                                        'Save'.tr,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      )
                                      : Center(
                                        child: CircularProgressIndicator(),
                                      ),
                            ),
                          ),
                        ],
                      )
                      : Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.destinationZipController.value.text =
            "${picked.toLocal()}".split(' ')[0]; // Format the date as needed
      });
    }
  }
}
