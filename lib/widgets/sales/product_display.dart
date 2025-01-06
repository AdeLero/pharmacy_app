import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDisplay extends StatelessWidget {
  final String? pharmaceuticalName;
  final String? brandName;
  final String? companyName;
  final String? variant;
  final String dosageForm;
  final String strength;
  final Function() onTap;
  const ProductDisplay({
    super.key,
    this.pharmaceuticalName,
    this.brandName,
    this.companyName,
    this.variant,
    required this.dosageForm,
    required this.strength,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final productName = [
      if (pharmaceuticalName != null) pharmaceuticalName,
      if (brandName != null) brandName,
      if (variant != null) "($variant)",
      if (companyName != null) "($companyName)",
      dosageForm,
    ].join(" ");
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                productName,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            Row(
              children: [
                Text(
                  strength,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_rounded,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
