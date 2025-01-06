import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, Routes.signIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: appTheme.primaryColor,
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          child: Image.asset(
            "lib/assets/images/pebble_no_bg.png",
          ),
        ),
      ),
    );
  }
}
