import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/widgets/spacing/x_margin.dart';

class HomeNavButtons extends StatelessWidget {
  final Function() onTap;
  final String label;
  final IconData icon;
  final String description;
  final bool isProduct;
  final String? productVolume;
  final String? totalProductPrice;
  const HomeNavButtons({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
    required this.description,
    this.isProduct = false,
    this.productVolume,
    this.totalProductPrice,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minHeight: 150.h,
          minWidth: 150.h,
        ),
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.deepPurple,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.selectiveYellow,
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.teaGreen,
                    size: 24.sp,
                  ),
                ),
                XMargin(8.w),
                Flexible(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.teaGreen,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
            if(isProduct)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(
                productVolume ?? "x",
                style: TextStyle(
                  color: AppColors.teaGreen,
                  fontSize: 13.sp,
                ),
              ),
                Text(
                  "\u20A6 ${totalProductPrice ?? 0}" ,
                  style: TextStyle(
                    color: AppColors.teaGreen,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Divider(
                  color: AppColors.ashGrey,
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: AppColors.ashGrey,
                    fontSize: 10.sp,
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
