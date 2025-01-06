import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/widgets/expiring_soon_display.dart';
import 'package:pebble_pharmacy/widgets/home_nav_buttons.dart';
import 'package:pebble_pharmacy/widgets/profit_summary.dart';
import 'package:pebble_pharmacy/widgets/spacing/x_margin.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: ProfitSummary()),
                ],
              ),
              YMargin(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: ExpiringSoonDisplay()),
                  XMargin(16.w),
                  Expanded(
                      child: HomeNavButtons(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.createProduct);
                    },
                    label: "Add a Product",
                    icon: Icons.add,
                    description: "Click to Add a Product",
                  )),
                ],
              ),
              YMargin(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: HomeNavButtons(
                      onTap: () {},
                      isProduct: true,
                      label: "Total Products",
                      description: "Click to view all Products",
                      icon: Icons.medication,
                      productVolume: "5000",
                      totalProductPrice: "5000",
                    ),
                  ),
                  XMargin(16.w),
                  Flexible(
                    child: HomeNavButtons(
                      onTap: () {},
                      label: "Low Stock",
                      icon: Icons.inventory,
                      description: "Click to see Products that are low",
                    ),
                  ),
                ],
              ),
              YMargin(16.h),
              Row(
                children: [
                  Flexible(
                    child: HomeNavButtons(
                      onTap: () {},
                      label: "Ask Medwiz",
                      icon: CupertinoIcons.chat_bubble_text_fill,
                      description: "Click to chat with Medwiz AI",
                    ),
                  ),
                  XMargin(16.w),
                  Flexible(
                    child: HomeNavButtons(
                      onTap: () {},
                      label: "Re-Order with SARA",
                      icon: FontAwesomeIcons.s,
                      description: "Let SARA AI re-order for you",
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
