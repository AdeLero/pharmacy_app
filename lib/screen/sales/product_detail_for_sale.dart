import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/sales/pack_size_selector.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';

class ProductDetailForSale extends StatelessWidget {
  const ProductDetailForSale({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryColor,
      appBar: AppBar(
        backgroundColor: appTheme.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24.sp,
            color: AppColors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Paracetamol Tabs",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 36.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "M&B",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "500mg",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24.sp,
                  ),
                ),
              ],
            ),
            YMargin(60.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    PackSizeSelector(),
                    YMargin(8.h),
                    PackSizeSelector(),
                    YMargin(8.h),
                    PackSizeSelector(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "\u20A6 20,000",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            YMargin(60.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: AppColors.errorRed,
                    size: 48.sp,
                  ),
                ),
                Text(
                  "5",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle_outline_rounded,
                    color: AppColors.lightGreen,
                    size: 48.sp,
                  ),
                ),
              ],
            ),
            YMargin(96.h),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.saleList);
                    },
                    label: "Add to sale",
                    backgroundColor: AppColors.white,
                    labelStyle: TextStyle(
                      color: appTheme.primaryColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
