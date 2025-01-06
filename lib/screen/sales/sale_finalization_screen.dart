import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/sales/sale_summary.dart';
import 'package:pebble_pharmacy/widgets/spacing/x_margin.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';

class SaleFinalizationScreen extends StatelessWidget {
  const SaleFinalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24.sp,
            color: appTheme.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sale ID",
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                Text(
                  "0001",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.lightGray,
                  ),
                ),
              ],
            ),
            SaleSummary(),
            YMargin(48.h),
            Row(
              children: [
                Expanded(
                    child: AppButton(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName(Routes.landing));
                  },
                  label: "Complete Sale",
                )),
                XMargin(24.w),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.selectiveYellow,
                    ),
                    child: Icon(
                      Icons.print,
                      size: 24.sp,
                      color: AppColors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
