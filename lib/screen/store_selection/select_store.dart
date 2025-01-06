import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colorscheme.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';
import 'package:pebble_pharmacy/widgets/store_type_card.dart';

class SelectStore extends StatelessWidget {
  const SelectStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Store",
              style: TextStyle(
                color: appLightMode.surface,
                fontWeight: FontWeight.w900,
                fontSize: 40.sp,
              ),
            ),
            YMargin(50.h),
            // TODO Change this to a ListView when the logic for the store is complete
            StoreTypeCard(
              isWarehouse: true,
              storeName: "Atan Store",
              userRole: "Manager",
              onTap: () {
                Navigator.pushNamed(context, Routes.createStore);
              },
            ),
            YMargin(10.h),
            StoreTypeCard(
              storeName: "Ijako Store",
              userRole: "Salesperson",
            ),

            // After ListView

            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: AppButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signIn);
                },
                label: "Sign Out",
                isOutlined: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
