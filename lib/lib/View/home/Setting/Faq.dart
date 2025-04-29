import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Component/app_colors.dart';
import '../../../Controller/HomeController.dart';

class FAQ extends StatelessWidget {
  final HomeController controller = Get.find();

  FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Faqs")),
        body: Obx(
          () => Container(
            //  color: Colors.white70,
            width: double.infinity,
            child:
                controller.faqProcess.value
                    ? (controller.listFaqs.isNotEmpty
                        ? ListView.builder(
                          itemBuilder:
                              (context, index) => SizedBox(
                                // height: getProportionateScreenHeight(150),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Bubble(
                                        margin: const BubbleEdges.only(
                                          top: 12,
                                          bottom: 12,
                                        ),
                                        alignment: Alignment.topRight,
                                        nip: BubbleNip.rightBottom,
                                        color: AppColors.primary.withOpacity(
                                          0.8,
                                        ),
                                        child: Text(
                                          controller.listFaqs[index].question
                                              .toString(),
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Bubble(
                                        margin: const BubbleEdges.only(
                                          bottom: 12,
                                        ),
                                        alignment: Alignment.topLeft,
                                        nip: BubbleNip.leftBottom,
                                        color: Colors.grey[300],
                                        child: Text(
                                          controller.listFaqs[index].answer
                                              .toString(),
                                          style: const TextStyle(
                                            color: Color(0xff283886),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.listFaqs.length,
                          //     scrollDirection: Axis.horizontal,
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
                                    "Empty",
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
