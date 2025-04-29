import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:typed_data';
import '../../../Component/app_colors.dart';

class StayTuneTab extends StatelessWidget {
  StayTuneTab({super.key});
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News'.tr,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Obx(
          () => Expanded(
            child: RefreshIndicator(
              child:
                  controller.getnews.value
                      ? (controller.listNews.isNotEmpty
                          ? ListView.builder(
                            itemCount: controller.listNews.length,
                            padding: EdgeInsets.all(12),
                            itemBuilder: (context, index) {
                              final item = controller.listNews[index];
                              final date = DateFormat(
                                'yyyy-MM-dd',
                              ).format(DateTime.parse(item.dat.toString()));
                              final base64Image = item.imageB64;
                              Uint8List? imageBytes;

                              if (base64Image != null) {
                                try {
                                  imageBytes = base64Decode(base64Image);
                                } catch (e) {
                                  print("Invalid base64 image: $e");
                                }
                              }

                              return Card(
                                elevation: 3,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (imageBytes != null)
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.memory(
                                            imageBytes,
                                            width: double.infinity,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      SizedBox(height: 12),
                                      Text(
                                        item.title.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        date,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        item.content.toString(),
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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
              onRefresh: () => controller.getNews(),
            ),
          ),
        ),
      ),
    );
  }
}
