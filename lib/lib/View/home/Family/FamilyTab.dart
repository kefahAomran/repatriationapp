import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Component/app_colors.dart';
import '../../../Component/custom_textfield.dart';
import '../../../Controller/HomeController.dart';
import 'add_family_member_screen.dart';
import 'familyInfo.dart';
import 'family_doc_veiw_screen.dart';

class FamilyTab extends StatelessWidget {
  FamilyTab({super.key});
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Family Info'.tr,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            try {
              controller.chooseHealth = null;
              controller.chooseDiplom = null;
              controller.chooseLiving = null;
              controller.choosejob = null;
              controller.chooseMarriage = null;
              controller.chooserelative = null;
              controller.motherNameController.value.clear();
              controller.idController.value.clear();
              controller.birthDateController.value.clear();
              controller.chooseGender = null;
              controller.firstNameController.value.clear();
              controller.fatherNameController.value.clear();
              controller.lastNameController.value.clear();
              Get.to(AddFamilyMemberScreen(isEdit: false, idReq: 0));
            } catch (e) {
              print(e);
            }
          },
          backgroundColor: AppColors.primary,
          child: Icon(Icons.add, color: AppColors.white),
        ),
        body: Obx(
          () => Padding(
            padding: EdgeInsets.all(10.w),
            child:
                controller.getgetFamilymember.value
                    ? Column(
                      children: [
                        SizedBox(height: 24.h),
                        Card(
                          elevation: 3,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 15.h),
                                      Text(
                                        "${'Head Of Family:'.tr} ${controller.HeadOfFamily}"
                                            .tr,
                                      ),
                                      SizedBox(height: 20.h),
                                      Text(
                                        "${'Family member Count:'.tr} ${controller.listFamilyMember.length.toString()}",
                                      ),

                                      SizedBox(height: 20.h),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.to(EditFamilyInfoScreen());
                                      },
                                      icon: Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        String x = await controller.getDoc();
                                        if (x == "") {
                                          Get.to(() => FamilyDocVeiwScreen());
                                        } else {
                                          Get.snackbar("Alert", x);
                                        }
                                      },
                                      icon: Icon(Icons.description),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () => controller.getFamilyMember(),
                            child: ListView.builder(
                              itemCount: controller.listFamilyMember.length,

                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Icon(
                                    Icons.check_circle,
                                    color: AppColors.primary,
                                  ),
                                  title: Text(
                                    controller.listFamilyMember[index].firstName
                                        .toString(),
                                  ),
                                  subtitle: Text(
                                    controller.listFamilyMember[index].lastName
                                        .toString(),
                                  ),
                                  trailing: PopupMenuButton(
                                    enableFeedback: true,
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.black,
                                    ),
                                    itemBuilder:
                                        (
                                          BuildContext context,
                                        ) => <PopupMenuEntry>[
                                          PopupMenuItem(
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.edit,
                                                color: AppColors.primary,
                                              ),
                                              title: Text('Edit'.tr),
                                              onTap: () {
                                                try {
                                                  controller.chooseHealth =
                                                      controller
                                                          .listFamilyMember[index]
                                                          .health;
                                                  controller.chooseDiplom =
                                                      controller
                                                          .listFamilyMember[index]
                                                          .diplom;
                                                  controller.chooseLiving =
                                                      controller
                                                          .listFamilyMember[index]
                                                          .living;
                                                  controller.choosejob =
                                                      controller
                                                          .listFamilyMember[index]
                                                          .job;
                                                  controller.chooseMarriage =
                                                      controller
                                                          .listFamilyMember[index]
                                                          .marriage;
                                                  controller.chooserelative =
                                                      controller
                                                          .listFamilyMember[index]
                                                          .relative;
                                                  controller
                                                      .motherNameController
                                                      .value
                                                      .text = controller
                                                          .listFamilyMember[index]
                                                          .motherName!;
                                                  controller
                                                      .idController
                                                      .value
                                                      .text = controller
                                                          .listFamilyMember[index]
                                                          .nnbr!;
                                                  controller
                                                      .birthDateController
                                                      .value
                                                      .text = controller
                                                          .listFamilyMember[index]
                                                          .birthDate!;
                                                  controller.chooseGender =
                                                      controller
                                                          .listFamilyMember[index]
                                                          .gender;
                                                  controller
                                                      .firstNameController
                                                      .value
                                                      .text = controller
                                                          .listFamilyMember[index]
                                                          .firstName!;
                                                  controller
                                                      .fatherNameController
                                                      .value
                                                      .text = controller
                                                          .listFamilyMember[index]
                                                          .fatherName!;
                                                  controller
                                                      .lastNameController
                                                      .value
                                                      .text = controller
                                                          .listFamilyMember[index]
                                                          .lastName!;
                                                } catch (e) {
                                                  print(e);
                                                }
                                                Get.close(1);
                                                Get.to(
                                                  AddFamilyMemberScreen(
                                                    isEdit: true,
                                                    idReq:
                                                        controller
                                                            .listFamilyMember[index]
                                                            .id!,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          PopupMenuItem(
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.delete,
                                                color: AppColors.actionRed,
                                              ),
                                              title: Text('Delete'.tr),
                                              onTap: () {
                                                Get.close(1);
                                                Get.defaultDialog(
                                                  title: "Alert".tr,
                                                  middleText:
                                                      "Are you sure about this procedure?"
                                                          .tr,
                                                  cancel: Obx(
                                                    () => ElevatedButton(
                                                      onPressed:
                                                          controller
                                                                  .deleteProcess
                                                                  .value
                                                              ? () async {
                                                                String
                                                                error = await controller
                                                                    .deleteFamilyMember(
                                                                      controller
                                                                          .listFamilyMember[index]
                                                                          .id!,
                                                                      controller
                                                                          .listFamilyMember[index],
                                                                    );
                                                                if (error !=
                                                                    "") {
                                                                  Get.snackbar(
                                                                    "Alert".tr,
                                                                    error,
                                                                  );
                                                                } else {
                                                                  Get.snackbar(
                                                                    "Done".tr,
                                                                    "Deleted successfully"
                                                                        .tr,
                                                                  );
                                                                }
                                                                Get.close(1);
                                                              }
                                                              : null,
                                                      child:
                                                          controller
                                                                  .deleteProcess
                                                                  .value
                                                              ? Text("Yes".tr)
                                                              : Center(
                                                                child:
                                                                    CircularProgressIndicator(),
                                                              ),
                                                    ),
                                                  ),
                                                  confirm: ElevatedButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text("No".tr),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                    : Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
