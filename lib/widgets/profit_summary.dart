import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/widgets/spacing/x_margin.dart';

class ProfitSummary extends StatelessWidget {
  const ProfitSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
        left: 16.w,
        bottom: 108.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        image: DecorationImage(
          image: AssetImage("lib/assets/images/pebble_trend_image.jpeg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(AppColors.black.withOpacity(0.6), BlendMode.darken),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profit",
            style: TextStyle(
              color: AppColors.teaGreen,
              fontSize: 13.sp,
            ),
          ),
          Text(
            "15,000,000",
            style: TextStyle(
              color: AppColors.teaGreen,
              fontSize: 25.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.white,
                ),
                child: Text(
                  "15%",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ),
              XMargin(8.w),
              Text(
                "Up from Yesterday",
                style: TextStyle(
                  color: AppColors.teaGreen,
                  fontSize: 13.sp,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
