import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/customization/theme/colorscheme.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/appTextField.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 50.h,
                left: 20.w,
                right: 20.w,
                bottom: 25.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.signUp);
                      },
                      isOutlined: true,
                      label: "Sign Up",
                    ),
                  ),
                  Text(
                    "Welcome to Pebble Pharmacy",
                    style: TextStyle(
                      color: appLightMode.surface,
                      fontWeight: FontWeight.w900,
                      fontSize: 40.sp,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 35.h,
                left: 40.w,
                right: 40.w,
              ),
              width: double.maxFinite,
              height: 597.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
                color: appLightMode.surface,
              ),
              child: Column(
                children: [
                  Text(
                    "Login to your Account",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),
                  YMargin(70.h),
                  AppTextField(
                    label: "Username",
                    isFilled: true,
                    hasOutline: false,
                    prefixIconButton: Icon(
                      Icons.person,
                      size: 24,
                    ),
                  ),
                  YMargin(70.h),
                  AppTextField(
                    label: "Password",
                    isFilled: true,
                    hasOutline: true,
                    isPassword: true,
                    prefixIconButton: Icon(Icons.lock),
                  ),
                  YMargin(70.h),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.welcomeBack);
                          },
                          label: "Log In",
                        ),
                      ),
                    ],
                  ),
                  YMargin(70.h),
                  Row(
                    children: [
                      Expanded(
                          child: AppButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signUp);
                        },
                        label: "I don't have an account",
                            isText: true,
                      ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
