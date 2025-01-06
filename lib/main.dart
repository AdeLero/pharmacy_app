import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/routes/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
    Future.delayed(Duration(seconds: 2), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    });
  });
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: null,
    systemNavigationBarIconBrightness: Brightness.light,
  ));


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 917),
        minTextAdapt: true,
        splitScreenMode: true,
        child:  MaterialApp(
          title: "Pebble Pharmacy",
          theme: appTheme,
          routes: appRoutes,
          onGenerateRoute: (settings) {
            final matchingRoute = screens.firstWhere(
                (route) => route.name == settings.name,
              orElse: () => throw Exception("Route not found: ${settings.name}"),
            );
            return MaterialPageRoute(builder: (context) => matchingRoute.page(settings.arguments));
          },
          // home: ,
        ),
    );
  }
}
