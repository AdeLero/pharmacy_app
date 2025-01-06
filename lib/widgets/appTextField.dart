import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final bool isFilled;
  final bool hasOutline;
  final bool isPassword;
  final bool isReadOnly;
  final Color? hintTextColor;
  final Color? fillColor;
  final Color? prefixColor;
  final Color? suffixColor;
  final Color? labelColor;
  final Color? textColor;
  final Widget? prefixIconButton;
  final IconData? suffixIconButton1;
  final IconData? suffixIconButton2;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final double? borderRadius;
  final Function()? onSuffixTap;
  const AppTextField({
    super.key,
    required this.label,
    this.hintText,
    this.isFilled = false,
    this.hasOutline = true,
    this.isPassword = false,
    this.isReadOnly = false,
    this.hintTextColor,
    this.fillColor,
    this.prefixColor,
    this.suffixColor,
    this.labelColor,
    this.textColor,
    this.prefixIconButton,
    this.suffixIconButton1,
    this.suffixIconButton2,
    this.floatingLabelBehavior,
    this.borderRadius,
    this.onSuffixTap,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? obscureText : false,
      readOnly: widget.isReadOnly,
      style: TextStyle(
        color: widget.textColor ?? AppColors.black,
      ),
      decoration: InputDecoration(
          filled: widget.isFilled,
          fillColor: widget.fillColor ?? AppColors.palePurple,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.hintTextColor,
          ),
          prefixIcon: widget.prefixIconButton,
          suffixIcon: widget.isPassword ? GestureDetector(
            onTap: widget.onSuffixTap ?? () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(
              obscureText ? widget.suffixIconButton1 ?? CupertinoIcons.eye : widget.suffixIconButton2 ?? CupertinoIcons.eye_slash,
              color: widget.suffixColor ?? AppColors.gray,
            ),
          ) : null,
          label: Text(
            widget.label,
            style: TextStyle(
              color: widget.labelColor ?? AppColors.gray,
              fontSize: 12.sp,
            ),
          ),
          floatingLabelBehavior: widget.floatingLabelBehavior,
          prefixIconColor: widget.prefixColor ?? AppColors.gray,
          border: OutlineInputBorder(
            borderSide: widget.hasOutline ? BorderSide() : BorderSide.none,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
          )),
    );
  }
}
