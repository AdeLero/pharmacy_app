import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/widgets/custom_slidable.dart';

class SaleListTile extends StatelessWidget {
  const SaleListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSlidable(
      borderRadius: 8.r,
      actionWidth: 50.w,
      foreground: Container(
        padding: EdgeInsets.all(16.w),
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Paracetamol (M&B) Tabs",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "500mg",
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Qty",
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  "\u20A6 Price",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.fancyBlue,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      background: Container(
        color: AppColors.errorRed,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
            child: Icon(Icons.delete_outline_outlined, color: AppColors.white,),
          ),
        ),
      ),
    );
  }
}
