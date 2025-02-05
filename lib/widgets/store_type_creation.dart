import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/models/store/store_category.dart';

class StoreTypeCreation extends HookConsumerWidget {
  final StoreCategory storeType;
  final IconData storeTypeIcon;
  final bool isSelected;
  final ValueChanged<StoreCategory> onSelect;
  const StoreTypeCreation({
    super.key,
    required this.storeType,
    required this.storeTypeIcon,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        onSelect(storeType);
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: EdgeInsets.only(
            left: 8.w,
            right: 8.w,
            top: 16.h,
            bottom: 8.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: isSelected ? AppColors.blackOlive : AppColors.teaGreen,
          ),
          height: 200,
          width: 150,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Icon(
                    storeTypeIcon,
                    color: isSelected ? AppColors.white : AppColors.black,
                    size: 36.w,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  storeType.name,
                  style: TextStyle(
                    color: isSelected ? AppColors.white : AppColors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.r),
                          color: isSelected
                              ? AppColors.selectiveYellow
                              : AppColors.deepPurple,
                        ),
                        child: Icon(
                          isSelected ? Icons.check : Icons.close,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
