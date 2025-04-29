import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

Widget buildDetailRow(String label, String? value, {bool isBold = false,Color? temp}) {
  return (value=="0"||value==""||value==null||value=="null")?Container(): Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 7,
          child: Text(
            label,
            style: TextStyle(
              fontSize:  (13.sp),
              fontWeight: FontWeight.bold

            ),
          ),
        ),
        Expanded(flex: 5,
          child: Text(
            value,
            style: TextStyle(
                fontSize:(13.sp),

                color: temp??Colors.black

            ),
          ),)
      ],
    ),
  );
}

