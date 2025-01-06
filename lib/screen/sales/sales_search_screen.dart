import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/widgets/appTextField.dart';
import 'package:pebble_pharmacy/widgets/sales/product_display.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';

class SalesSearchScreen extends StatelessWidget {
  const SalesSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepPurple,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24.w,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 16.h,
        ),
        child: Column(
          children: [
            AppTextField(
              isFilled: true,
              fillColor: AppColors.white,
              label: "Click Here to search a product",
              labelColor: AppColors.lightGray,
            ),
            YMargin(24.h),
            //TODO Convert to a ListView when the product logic is complete.
            ProductDisplay(
              onTap: () {
                Navigator.pushNamed(context, Routes.productDetailSale);
              },
              dosageForm: "Tabs",
              strength: "500mg",
              pharmaceuticalName: "Paracetamol",
              companyName: "M&B",
              // brandName: "",
            ),
            YMargin(8.h),
            ProductDisplay(
              onTap: () {},
              dosageForm: "Lozenges",
              strength: "x16",
              brandName: "Strepsils",
              variant: "Honey & Lemon",
            ),
          ],
        ),
      ),
    );
  }
}
