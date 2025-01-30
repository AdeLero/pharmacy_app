import 'package:flutter/material.dart';
import 'package:pebble_pharmacy/models/routes/app_routes.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/screen/analysis/analysis_screen.dart';
import 'package:pebble_pharmacy/screen/auth/sign_in.dart';
import 'package:pebble_pharmacy/screen/auth/sign_up.dart';
import 'package:pebble_pharmacy/screen/auth/welcome_back.dart';
import 'package:pebble_pharmacy/screen/home/home_screen.dart';
import 'package:pebble_pharmacy/screen/init/landing_page.dart';
import 'package:pebble_pharmacy/screen/init/splash_screen.dart';
import 'package:pebble_pharmacy/screen/product/create_product.dart';
import 'package:pebble_pharmacy/screen/product/set_pricing.dart';
import 'package:pebble_pharmacy/screen/sales/product_detail_for_sale.dart';
import 'package:pebble_pharmacy/screen/sales/sale_finalization_screen.dart';
import 'package:pebble_pharmacy/screen/sales/sale_list_screen.dart';
import 'package:pebble_pharmacy/screen/sales/sales_landing_screen.dart';
import 'package:pebble_pharmacy/screen/sales/sales_search_screen.dart';
import 'package:pebble_pharmacy/screen/store_selection/create_store.dart';
import 'package:pebble_pharmacy/screen/store_selection/select_store.dart';

final screens = [
  AppRoutes(
    name: Routes.splash,
    page: (_) => SplashScreen(),
  ),
  AppRoutes(
    name: Routes.signIn,
    page: (_) => SignIn(),
  ),
  AppRoutes(
    name: Routes.welcomeBack,
    page: (_) => WelcomeBack(),
  ),
  AppRoutes(
    name: Routes.signUp,
    page: (_) => SignUp(),
  ),
  AppRoutes(
    name: Routes.selectStore,
    page: (_) => SelectStore(),
  ),
  AppRoutes(
    name: Routes.createStore,
    page: (_) => CreateStore(),
  ),
  AppRoutes(
    name: Routes.landing,
    page: (_) => LandingPage(),
  ),
  AppRoutes(
    name: Routes.salesLanding,
    page: (_) => SalesLandingScreen(),
  ),
  AppRoutes(
    name: Routes.home,
    page: (_) => HomeScreen(),
  ),
  AppRoutes(
    name: Routes.analysis,
    page: (_) => AnalysisScreen(),
  ),
  AppRoutes(
    name: Routes.salesSearch,
    page: (_) => SalesSearchScreen(),
  ),
  AppRoutes(
    name: Routes.productDetailSale,
    page: (_) => ProductDetailForSale(),
  ),
  AppRoutes(
    name: Routes.saleList,
    page: (_) => SaleListScreen(),
  ),
  AppRoutes(
    name: Routes.saleFinalization,
    page: (_) => SaleFinalizationScreen(),
  ),
  AppRoutes(
    name: Routes.createProduct,
    page: (_) => CreateProduct(),
  ),
  AppRoutes(
    name: Routes.setPricing,
    page: (_) => SetPricing(),
  )
];

Map<String, Widget Function(BuildContext)> appRoutes = {
  for (var route in screens)
    route.name: (context) {
      final arguments = ModalRoute.of(context)?.settings.arguments;
      return route.page(arguments);
    },
};
