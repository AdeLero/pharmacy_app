import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/customization/theme/colorscheme.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/widgets/spacing/x_margin.dart';

class StoreTypeCard extends StatelessWidget {
  final bool isWarehouse;
  final String storeName;
  final String userRole;
  final Function()? onTap;
  const StoreTypeCard(
      {super.key, this.isWarehouse = false, required this.storeName, required this.userRole, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: appLightMode.surface,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isWarehouse ? AppColors.mustard : AppColors.brown,
          )
        ),
        child: Row(
          children: [
            Icon(
              isWarehouse ? FontAwesomeIcons.warehouse : FontAwesomeIcons.store,
              size: 48.h,
              color: appTheme.primaryColor,
            ),
            XMargin(40.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storeName,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  userRole,
                  style: TextStyle(
                    color: AppColors.gray,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
