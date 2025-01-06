import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/appTextField.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';
import 'package:pebble_pharmacy/widgets/store_type_creation.dart';

class CreateStore extends StatelessWidget {
  const CreateStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 50.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Store",
              style: TextStyle(
                color: AppColors.selectiveYellow,
                fontWeight: FontWeight.w900,
                fontSize: 40.sp,
              ),
            ),
            YMargin(90.h),
            AppTextField(
              label: "Store Name",
            ),
            YMargin(40.h),
            // TODO Change to ListView when the logic for stores is completed
            StoreTypeCreation(
              storeType: "Warehouse",
              storeTypeIcon: Icons.warehouse_rounded,
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.landing);
                    },
                    label: "Create Store",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
