import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/HomeController.dart';

import '../../../Component/app_colors.dart';
import '../../../Component/custom_textfield.dart';
import 'addRequest.dart';

class RequestTab extends StatelessWidget {
  RequestTab({super.key});
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Requests'.tr,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          controller.descController.value.clear();
          controller.chooseneed = null;
          Get.to(addRequest(isEdit: false, idReq: 0));
        },

        child: Icon(Icons.add, color: AppColors.white),
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () => controller.getRequest(),
          child:
              controller.getrequests.value
                  ? (controller.listRequest.isNotEmpty
                      ? ListView.builder(
                        itemCount: controller.listRequest.length,
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
                                                    controller
                                                        .descController
                                                        .value
                                                        .text = controller
                                                            .listRequest[index]
                                                            .notes!;
                                                    controller.chooseneed =
                                                        controller
                                                            .listRequest[index]
                                                            .need;
                                                    Get.close(1);
                                                    Get.to(
                                                      addRequest(
                                                        isEdit: true,
                                                        idReq:
                                                            controller
                                                                .listRequest[index]
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
                                                                    controller
                                                                        .getrequests(
                                                                          false,
                                                                        );
                                                                    String
                                                                    error = await controller.deleteRequest(
                                                                      controller
                                                                          .listRequest[index]
                                                                          .id!,
                                                                      controller
                                                                          .listRequest[index],
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
                                        "Need".tr,
                                        controller
                                            .listRequest[index]
                                            .need
                                            ?.displayName,
                                      ),
                                      buildDetailRow(
                                        "Desc".tr,
                                        controller.listRequest[index].notes,
                                      ),
                                      buildDetailRow(
                                        "Status".tr,
                                        controller.listRequest[index].result,
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
    );
  }
}
