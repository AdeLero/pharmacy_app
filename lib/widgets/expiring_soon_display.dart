import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/widgets/spacing/x_margin.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';

class ExpiringSoonDisplay extends StatelessWidget {
  const ExpiringSoonDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Expiring soon tapped");
      },
      // TODO Change to a listview with enough height for at least 2 products expiring soon.
      // This widget needs to update itself daily.
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.blackOlive,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "Expiring Soon",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 24.sp,
                  color: AppColors.white,
                ),
              ],
            ),
            YMargin(12.h),
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: AppColors.white,
                    width: 2.w,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Paracetamol (M&B) Tabs",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "500mg",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 8.sp,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "12 Satchets",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 8.sp,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  XMargin(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "02/25",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "BN:101100",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
