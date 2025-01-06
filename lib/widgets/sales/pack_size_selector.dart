import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';

class PackSizeSelector extends StatelessWidget {
  const PackSizeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white,
      ),
      child: Text(
        "Satchet",
        style: TextStyle(
          color: AppColors.black,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
