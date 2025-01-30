import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colorscheme.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';

class AppButton extends StatelessWidget {
  final bool isOutlined;
  final bool isText;
  final Function() onPressed;
  final String label;
  final TextStyle? labelStyle;
  final double? outlineThickness;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? outlineColor;
  final double? borderRadius;
  final double? horizontalPadding;
  const AppButton({
    super.key,
    this.isOutlined = false,
    this.isText = false,
    required this.onPressed,
    required this.label,
    this.labelStyle,
    this.outlineThickness,
    this.foregroundColor,
    this.backgroundColor,
    this.outlineColor,
    this.borderRadius,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    if (isText) {
      return TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: labelStyle ?? TextStyle(color: foregroundColor),
        ),
      );
    } else if (isOutlined) {
      return OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: WidgetStatePropertyAll(BorderSide(
            color: outlineColor ?? appLightMode.error,
            width: outlineThickness ?? 5.h,
          )),
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: horizontalPadding ?? 10.w)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
          )),
          foregroundColor:
              WidgetStatePropertyAll(foregroundColor ?? appLightMode.surface),
          backgroundColor:
              WidgetStatePropertyAll(backgroundColor ?? Colors.transparent),
        ),
        child: Text(
          label,
          style: labelStyle ??
              TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15.r))),
          backgroundColor:
              WidgetStatePropertyAll(backgroundColor ?? appTheme.primaryColor),
          foregroundColor: WidgetStatePropertyAll(
              foregroundColor ?? appTheme.scaffoldBackgroundColor),
        ),
        child: Text(
          label,
          style: labelStyle ?? TextStyle(),
        ),
      );
    }
  }
}
