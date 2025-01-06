import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/sales/sale_list_tile.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';

class SaleListScreen extends StatelessWidget {
  const SaleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryColor,
      appBar: AppBar(
        backgroundColor: appTheme.primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            size: 24.sp,
            color: AppColors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.h),
        // TODO Convert to listView once sale logic is complete
        child: Column(
          children: [
            SaleListTile(),
            YMargin(24.h),
            SaleListTile(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "\u20A6 40,000",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.saleFinalization);
                    },
                    label: "Proceed to Sale",
                    backgroundColor: AppColors.white,
                    labelStyle: TextStyle(
                      color: appTheme.primaryColor,
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
