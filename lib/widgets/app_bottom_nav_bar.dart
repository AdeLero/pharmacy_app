import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';

class AppNavItem {
  final Icon icon;
  final String label;

  AppNavItem({
    required this.icon,
    required this.label,
  });
}

class AppBottomNavBar extends StatelessWidget {
  final List<AppNavItem> items;
  final Color? backgroundColor;
  final Color? selectedColor;
  final double? iconSize;
  final int? currentIndex;
  final Function(int)? onTap;
  final bool showUnselectedLabels;
  final bool showSelectedLabels;
  const AppBottomNavBar({
    super.key,
    required this.items,
    this.selectedColor,
    this.iconSize,
    this.currentIndex,
    this.onTap,
    this.showUnselectedLabels = false,
    this.showSelectedLabels = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: backgroundColor,
      showSelectedLabels: showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels,
      currentIndex: currentIndex ?? 0,
      onTap: onTap,
      items: items.asMap().entries.map((entry) {
        int index = entry.key;
        AppNavItem item = entry.value;

        bool isSelected = index == currentIndex;

        return BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.teaGreen : null,
            ),
            child: Icon(
              item.icon.icon,
              size: iconSize ?? 24.h,
              color: AppColors.black,
            ),
          ),
          label: item.label,
        );
      }).toList(),
    );
  }
}
