import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/customization/theme/colorscheme.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/view_models/providers.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/appTextField.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';

class SignIn extends HookConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumberController = useTextEditingController();
    final pinController = useTextEditingController();

    final onboardingVM = ref.watch(onboardingProvider);

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
                    controller: phoneNumberController,
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
                    controller: pinController,
                    prefixIconButton: Icon(Icons.lock),
                  ),
                  YMargin(70.h),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onPressed: () async {

                            bool success =
                                await onboardingVM.logInUser(
                              phoneNumberController.text,
                              pinController.text,
                            );

                            if (success) {
                              Navigator.pushNamed(
                                  context, Routes.selectStore);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content:
                                  Text("LogIn failed")));
                            }
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
