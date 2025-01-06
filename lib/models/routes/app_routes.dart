import 'package:flutter/material.dart';

class AppRoutes {
  final String name;
  final Widget Function(dynamic arguments) page;

  AppRoutes({required this.name, required this.page});
}
