import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/customization/theme/colorscheme.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/appTextField.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                      label: "Sign Up",
                      isOutlined: true,
                    ),
                  ),
                  Text(
                    "Welcome Oluwafayokemi",
                    style: TextStyle(
                      color: appLightMode.surface,
                      fontWeight: FontWeight.w900,
                      fontSize: 40.sp,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: size.height * 0.8,
              padding: EdgeInsets.all(40.w),
              decoration: BoxDecoration(
                color: appLightMode.surface,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.r),
                  topLeft: Radius.circular(30.r),
                ),
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
                  YMargin(65.h),
                  AppTextField(
                    label: "Password",
                    isPassword: true,
                    isFilled: true,
                    hasOutline: false,
                    prefixIconButton: Icon(Icons.lock),
                  ),
                  YMargin(65.h),
                  Row(
                    children: [
                      Expanded(
                          child: AppButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.selectStore);
                        },
                        label: "Log In",
                      )),
                    ],
                  ),
                  YMargin(65.h),
                  Row(
                    children: [
                      Expanded(
                          child: AppButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signIn);
                        },
                        label: "Not Oluwafayokemi",
                        isOutlined: true,
                        outlineColor: appTheme.primaryColor,
                        outlineThickness: 1,
                        foregroundColor: appTheme.primaryColor,
                      )),
                    ],
                  ),
                  YMargin(65.h),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signUp);
                          },
                          label: "I don't have an Account",
                          isText: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
