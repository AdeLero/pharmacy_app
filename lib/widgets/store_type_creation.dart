import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';

class StoreTypeCreation extends StatefulWidget {
  final String storeType;
  final IconData storeTypeIcon;
  const StoreTypeCreation({super.key, required this.storeType, required this.storeTypeIcon});

  @override
  State<StoreTypeCreation> createState() => _StoreTypeCreationState();
}

class _StoreTypeCreationState extends State<StoreTypeCreation> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
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
                    widget.storeTypeIcon,
                    color: isSelected ? AppColors.white : AppColors.black,
                    size: 36.w,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.storeType,
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
                          color: isSelected ? AppColors.selectiveYellow : AppColors.deepPurple,
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
