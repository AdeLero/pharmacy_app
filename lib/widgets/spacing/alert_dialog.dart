import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';

class AppAlertDialog extends StatelessWidget {
  final String title;
  final Widget content;
  const AppAlertDialog({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            YMargin(48.h),
            content,
            YMargin(48.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  isOutlined: true,
                  label: "Set Later",
                  labelStyle: TextStyle(
                    color: appTheme.primaryColor,
                  ),
                  horizontalPadding: 24.w,
                  outlineColor: appTheme.primaryColor,
                  outlineThickness: 2,
                  onPressed: () {
                    //TODO change to the product List screen when available
                    Navigator.popUntil(
                        context, ModalRoute.withName(Routes.landing));
                  },
                ),
                AppButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.setPricing);
                  },
                  label: "Proceed",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
