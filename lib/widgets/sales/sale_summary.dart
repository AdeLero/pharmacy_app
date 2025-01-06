import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';

class SaleSummary extends StatelessWidget {
  const SaleSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.mustard,
          width: 1.w,
        ),
      ),
      // TODO Change to ListView once Sales Logic is complete
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "5 Satchets",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Paracetamol (M&B) Tabs",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
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
              Text(
                "\u20A6 20,000",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
          Divider(
            color: AppColors.lightGray,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Price",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),

              Text(
                "\u20A6 40,000",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
