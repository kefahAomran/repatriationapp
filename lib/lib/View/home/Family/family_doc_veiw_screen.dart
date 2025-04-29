import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Component/app_colors.dart';
import '../../../Component/custom_textfield.dart';
import '../../../Controller/HomeController.dart';
import 'AddDocumentScreen.dart';

class FamilyDocVeiwScreen extends StatefulWidget {
  const FamilyDocVeiwScreen({Key? key}) : super(key: key);

  @override
  _FamilyDocVeiwScreenState createState() => _FamilyDocVeiwScreenState();
}

class _FamilyDocVeiwScreenState extends State<FamilyDocVeiwScreen> {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Documents'.tr, textAlign: TextAlign.center),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            controller.documentDescController.value.clear();
            controller.base64String = null;
            controller.chooseDoctype = null;
            controller.chooseFamilyMemberModel = null;
            Get.to(AddDocumentContent(isEdit: false, idReq: 0));
          },

          child: Icon(Icons.add, color: AppColors.white),
        ),
        body: Obx(
          () => RefreshIndicator(
            onRefresh: () => controller.getDoc(),
            child:
                controller.getreDoc.value
                    ? (controller.listDocument.isNotEmpty
                        ? ListView.builder(
                          itemCount: controller.listDocument.length,
                          padding: EdgeInsets.all(12),

                          itemBuilder:
                              (BuildContext context, int index) => Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(12.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        PopupMenuButton(
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
                                                        print(1);
                                                        controller
                                                            .documentDescController
                                                            .value
                                                            .text = controller
                                                                .listDocument[index]
                                                                .desc
                                                                .toString();
                                                        controller
                                                                .base64String =
                                                            controller
                                                                .listDocument[index]
                                                                .imageB64!;
                                                        controller
                                                                .chooseDoctype =
                                                            controller
                                                                .listDocument[index]
                                                                .zdoctypId!;
                                                        for (var element
                                                            in controller
                                                                .listFamilyMember) {
                                                          if (element.id ==
                                                              controller
                                                                  .listDocument[index]
                                                                  .familyMemberId) {
                                                            controller
                                                                    .chooseFamilyMemberModel =
                                                                element;
                                                          }
                                                        }
                                                        print(2);
                                                      } catch (e) {
                                                        print(3);
                                                        print(e);
                                                      }
                                                      Get.close(1);
                                                      Get.to(
                                                        AddDocumentContent(
                                                          isEdit: true,
                                                          idReq:
                                                              controller
                                                                  .listDocument[index]
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
                                                      color:
                                                          AppColors.actionRed,
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
                                                                      controller
                                                                          .getrequests(
                                                                            false,
                                                                          );
                                                                      String
                                                                      error = await controller.deleteDoc(
                                                                        controller
                                                                            .listDocument[index]
                                                                            .id!,
                                                                        controller
                                                                            .listDocument[index],
                                                                      );
                                                                      if (error !=
                                                                          "") {
                                                                        Get.snackbar(
                                                                          "Alert"
                                                                              .tr,
                                                                          error,
                                                                        );
                                                                        Get.close(
                                                                          1,
                                                                        );
                                                                      } else {
                                                                        Get.snackbar(
                                                                          "Done"
                                                                              .tr,
                                                                          "Deleted successfully"
                                                                              .tr,
                                                                        );
                                                                        Get.close(
                                                                          1,
                                                                        );
                                                                      }
                                                                      controller
                                                                          .getrequests(
                                                                            true,
                                                                          );
                                                                    }
                                                                    : null,
                                                            child:
                                                                controller
                                                                        .deleteProcess
                                                                        .value
                                                                    ? Text(
                                                                      "Yes".tr,
                                                                    )
                                                                    : const CircularProgressIndicator(
                                                                      color:
                                                                          Colors
                                                                              .white,
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
                                      ],
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        buildDetailRow(
                                          "Document type".tr,
                                          controller
                                              .listDocument[index]
                                              .zdoctypId
                                              ?.displayName,
                                        ),
                                        buildDetailRow(
                                          "Document Description".tr,
                                          controller.listDocument[index].desc,
                                        ),

                                        buildDetailRow(
                                          "Family Member".tr,
                                          controller.listFamilyMember
                                              .firstWhereOrNull(
                                                (element) =>
                                                    element.id ==
                                                    controller
                                                        .listDocument[index]
                                                        .familyMemberId,
                                              )
                                              ?.firstName
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        )
                        : Center(
                          child: ListView(
                            children: [
                              SizedBox(height: 250.h),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.hourglass_empty_outlined,
                                    size: 50.sp,
                                  ),
                                  SizedBox(height: 50.h),
                                  Text(
                                    "Empty".tr,
                                    style: TextStyle(fontSize: 25.sp),
                                  ), // No subscriptions text
                                ],
                              ),
                            ],
                          ),
                        ))
                    : Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
