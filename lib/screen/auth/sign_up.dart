import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/appTextField.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: AppButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signIn);
                  },
                  label: "Sign In",
                  isOutlined: true,
                ),
              ),
              YMargin(50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    AppTextField(
                      label: "Username",
                      isFilled: true,
                      prefixIconButton: Icon(Icons.person),
                    ),
                    YMargin(40.h),
                    AppTextField(
                      label: "User Type",
                      isFilled: true,
                      prefixIconButton: Icon(FontAwesomeIcons.addressCard),
                    ),
                    YMargin(40.h),
                    AppTextField(
                      label: "Password",
                      isFilled: true,
                      prefixIconButton: Icon(FontAwesomeIcons.lock),
                    ),
                    YMargin(40.h),
                    AppTextField(
                      label: "Re-enter Password",
                      isFilled: true,
                      prefixIconButton: Icon(FontAwesomeIcons.lock),
                    ),
                    YMargin(40.h),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.selectStore);
                            },
                            label: "Sign Up",
                            isOutlined: true,
                            outlineThickness: 1,
                            outlineColor: appTheme.scaffoldBackgroundColor,
                          ),
                        ),
                      ],
                    ),
                    YMargin(40.h),
                    Row(
                      children: [
                        Expanded(
                            child: AppButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signIn);
                          },
                          label: "I already have an account",
                          isText: true,
                          foregroundColor: appTheme.scaffoldBackgroundColor,
                        ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
