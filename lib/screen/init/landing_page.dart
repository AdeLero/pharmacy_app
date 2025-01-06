import 'package:flutter/material.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/screen/analysis/analysis_screen.dart';
import 'package:pebble_pharmacy/screen/home/home_screen.dart';
import 'package:pebble_pharmacy/screen/sales/sales_landing_screen.dart';
import 'package:pebble_pharmacy/widgets/app_bottom_nav_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const SalesLandingScreen(),
        const HomeScreen(),
        const AnalysisScreen(),
      ][currentPageIndex],
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: currentPageIndex,
        backgroundColor: AppColors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: [
          AppNavItem(icon: Icon(Icons.point_of_sale_sharp), label: "Sales"),
          AppNavItem(icon: Icon(Icons.home), label: "Home"),
          AppNavItem(icon: Icon(Icons.analytics_outlined), label: "Analysis"),
        ],
      ),
    );
  }
}
