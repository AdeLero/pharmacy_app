import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/appTextField.dart';
import 'package:pebble_pharmacy/widgets/spacing/alert_dialog.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({super.key});

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
          "Add a Product",
          style: TextStyle(
            fontSize: 23.sp,
            fontWeight: FontWeight.w900,
            color: AppColors.white,
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Name",
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            YMargin(4.h),
            AppTextField(
              label: "Paracetamol, Metronidazole",
              labelColor: AppColors.lightGray,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            YMargin(16.h),
            Text(
              "Brand Name",
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            YMargin(4.h),
            AppTextField(
              label: "Bonadol, Flagyl, Emgyl",
              labelColor: AppColors.lightGray,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            YMargin(16.h),
            Text(
              "Manufacturing Company Name",
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            YMargin(4.h),
            AppTextField(
              label: "Fidson, M&B, Emzor",
              labelColor: AppColors.lightGray,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            YMargin(16.h),
            Text(
              "Product Strength/volume",
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            YMargin(4.h),
            AppTextField(
              label: "500mg, 50ml, 200iu",
              labelColor: AppColors.lightGray,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            YMargin(16.h),
            Text(
              "Dosage Form",
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            YMargin(4.h),
            AppTextField(
              label: "Syrup, Tabs, Vial",
              labelColor: AppColors.lightGray,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            YMargin(56.h),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AppAlertDialog(
                              title: "Proceed to Set Pricing?",
                              content: Text(
                                "{ProductNomenclature} wil be added to your inventory. Proceed to set the Pricing?",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                            );
                          });
                    },
                    label: "Create Product",
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
