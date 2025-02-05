import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/models/user/role_model.dart';
import 'package:pebble_pharmacy/models/user/user_model.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/view_models/providers.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/appTextField.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';

class SignUp extends HookConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final reEnterPasswordController = useTextEditingController();
    final phoneNumberController = useTextEditingController();

    final selectedRole = useState<Role>(Role.retailAssociate);

    final onboardingVM = ref.watch(onboardingProvider);

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
                      controller: usernameController,
                      prefixIconButton: Icon(Icons.person),
                    ),
                    YMargin(40.h),
                    AppTextField(
                      label: "Phone Number",
                      isFilled: true,
                      controller: phoneNumberController,
                      prefixIconButton: Icon(FontAwesomeIcons.addressCard),
                    ),
                    YMargin(40.h),
                    AppTextField(
                      label: "Pin",
                      isFilled: true,
                      controller: passwordController,
                      prefixIconButton: Icon(FontAwesomeIcons.lock),
                    ),
                    YMargin(40.h),
                    AppTextField(
                      label: "Re-enter Pin",
                      isFilled: true,
                      controller: reEnterPasswordController,
                      prefixIconButton: Icon(FontAwesomeIcons.lock),
                    ),
                    YMargin(40.h),
                    DropdownButtonFormField<Role>(
                        value: selectedRole.value,
                        items: Role.values.map((Role role) {
                          return DropdownMenuItem<Role>(
                            value: role,
                            child: Text(role.name),
                          );
                        }).toList(),
                        onChanged: (Role? newRole) {
                          if (newRole != null) {
                            selectedRole.value = newRole;
                          }
                        },
                      decoration: InputDecoration(
                        labelText: "Select Role",
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                    ),

                    YMargin(40.h),
                    Row(
                      children: [
                        Expanded(
                          child: onboardingVM.isLoading
                              ? Center(child: CircularProgressIndicator())
                              : AppButton(
                                  onPressed: () async {
                                    if (passwordController.text !=
                                        reEnterPasswordController.text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Passwords do not match")));
                                      return;
                                    }

                                    User? user =
                                        await onboardingVM.registerUser(
                                      usernameController.text,
                                      phoneNumberController.text,
                                      passwordController.text,
                                      "manager",
                                    );

                                    if (user != null) {
                                      Navigator.pushNamed(
                                          context, Routes.selectStore);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text("Registration failed")));
                                    }
                                  },
                                  label: "Sign Up",
                                  isOutlined: true,
                                  outlineThickness: 1,
                                  outlineColor:
                                      appTheme.scaffoldBackgroundColor,
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
