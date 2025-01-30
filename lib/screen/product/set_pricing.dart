import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';

class SetPricing extends StatelessWidget {
  const SetPricing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.primaryColor,
        centerTitle: true,
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
        title: Text(
          "Set Pricing",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 23.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz_rounded,
              size: 24.sp,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
